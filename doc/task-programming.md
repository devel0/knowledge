# task programming

- [sample bg task](#sample-bg-task)
- [parallel tasks](#parallel-tasks)

## sample bg task

```csharp
var cts = new CancellationTokenSource();

var bgtask = Task.Run(async () =>
{
    try
    {        
        for (int i = 0; i < 10; ++i)
        {
            Console.WriteLine($"{i} working");
            await Task.Delay(1000, cts.Token);
        }
    }
    catch (OperationCanceledException)
    {
        Console.WriteLine("======> CANCELED");
    }
    catch (Exception ex)
    {
        Console.WriteLine($"ex: {ex.Message}");
    }    
});

Console.WriteLine("RDY");
await Task.Delay(1000);
Console.WriteLine("CANCELLING");
cts.Cancel();

bgtask.Wait();
```

output is:

```
RDY
0 working
1 working
CANCELLING
======> CANCELED
```

## parallel tasks

```csharp
var degreeOfParallelism = 5;
var itemsCount = 30;
var fakeWaitPerItemSec = 2;
var stopAtPercent = .7;

var taskArgs = Enumerable.Range(0, itemsCount - 1).ToList();

async Task WorkTaskAsync(int taskarg, CancellationToken cancellationToken)
{
    Console.WriteLine($"task running task (arg:{taskarg})");
    await Task.Delay(TimeSpan.FromSeconds(fakeWaitPerItemSec), cancellationToken); // cancel mostly appears here
    Console.WriteLine($"task completed (arg:{taskarg})");
}

async Task Method1Async(Action<int> onCompleted, CancellationToken cancellationToken)
{    
    await Parallel.ForEachAsync(
        taskArgs,
        new ParallelOptions
        {
            MaxDegreeOfParallelism = degreeOfParallelism,
            CancellationToken = cancellationToken
        },
        async (taskArg, cancellationToken) =>
        {
            await WorkTaskAsync(taskArg, cancellationToken);
            onCompleted(taskArg);
        }
    );

}

async Task Method2Async(Action<int> onCompleted, CancellationToken cancellationToken)
{
    var sem = new SemaphoreSlim(degreeOfParallelism);
    List<Task> runningTasks = new();

    foreach (var taskArg in taskArgs)
    {
        if (cancellationToken.IsCancellationRequested) break;

        var task = Task.Run(async () =>
        {
            await sem.WaitAsync(cancellationToken);

            try
            {
                await WorkTaskAsync(taskArg, cancellationToken);
                onCompleted(taskArg);
            }
            finally
            {
                sem.Release(); // release semaphore if exception or even a return occurs
            }
        });
        runningTasks.Add(task);
    }

    await Task.WhenAll(runningTasks);
}
;

async Task Show(string desc, Func<Action<int>, CancellationToken, Task> method)
{
    Console.WriteLine();
    Console.WriteLine("==========================================");
    Console.WriteLine($"  {desc}");
    Console.WriteLine("==========================================");

    var taskCompleted = taskArgs.Select(x => false).ToList();
    var cts = new CancellationTokenSource();
    var start = DateTimeOffset.Now;

    var cancelJobTask = Task.Run(async () =>
    {
        var totalMinTime = TimeSpan.FromSeconds(fakeWaitPerItemSec) * itemsCount / degreeOfParallelism;
        await Task.Delay(totalMinTime - totalMinTime * (1 - stopAtPercent));
        Console.WriteLine("MASTER CANCEL");
        cts.Cancel();
    });

    try
    {
        await method(taskArg => taskCompleted[taskArg] = true, cts.Token);
    }
    catch (OperationCanceledException)
    {
        Console.WriteLine("prematurely end tasks job");
    }

    Console.WriteLine();
    Console.WriteLine($"{taskCompleted.Count(w => w == true)} of {itemsCount} FINISHED {DateTimeOffset.Now - start}");
    Console.WriteLine();

    for (var i = 0; i < taskArgs.Count; ++i)
        Console.Write($"{i % 10}");
    Console.WriteLine();
    for (var i = 0; i < taskArgs.Count; ++i)
        Console.Write($"{(taskCompleted[i] ? "X" : "-")}");
    Console.WriteLine();

}

await Show("METHOD1", Method1Async);

await Show("METHOD2", Method2Async);
```

execution results ( either methods process 70% of requested items )

```
==========================================
  METHOD1
==========================================
task running task (arg:3)
task running task (arg:1)
task running task (arg:2)
task running task (arg:4)
task running task (arg:0)
task completed (arg:3)
task completed (arg:1)
task completed (arg:0)
task completed (arg:2)
task completed (arg:4)
task running task (arg:6)
task running task (arg:5)
task running task (arg:7)
task running task (arg:8)
task running task (arg:9)
task completed (arg:9)
task completed (arg:8)
task completed (arg:7)
task completed (arg:5)
task completed (arg:6)
task running task (arg:10)
task running task (arg:11)
task running task (arg:12)
task running task (arg:14)
task running task (arg:13)
task completed (arg:13)
task running task (arg:15)
task completed (arg:14)
task completed (arg:11)
task running task (arg:16)
task running task (arg:17)
task completed (arg:12)
task running task (arg:18)
task completed (arg:10)
task running task (arg:19)
task completed (arg:19)
task completed (arg:17)
task running task (arg:20)
task completed (arg:16)
task running task (arg:22)
task completed (arg:18)
task running task (arg:23)
task completed (arg:15)
task running task (arg:21)
task running task (arg:24)
MASTER CANCEL
prematurely end tasks job

20 of 30 FINISHED 00:00:08.4194607

01234567890123456789012345678
XXXXXXXXXXXXXXXXXXXX---------

==========================================
  METHOD2
==========================================
task running task (arg:1)
task running task (arg:0)
task running task (arg:2)
task running task (arg:3)
task running task (arg:28)
task completed (arg:2)
task completed (arg:1)
task completed (arg:28)
task completed (arg:3)
task running task (arg:4)
task completed (arg:0)
task running task (arg:13)
task running task (arg:6)
task running task (arg:14)
task running task (arg:16)
task completed (arg:14)
task running task (arg:15)
task completed (arg:16)
task completed (arg:13)
task running task (arg:17)
task running task (arg:18)
task completed (arg:4)
task completed (arg:6)
task running task (arg:19)
task running task (arg:21)
task completed (arg:17)
task completed (arg:21)
task running task (arg:20)
task completed (arg:18)
task completed (arg:15)
task running task (arg:23)
task running task (arg:22)
task running task (arg:7)
task completed (arg:19)
task running task (arg:26)
task completed (arg:26)
task completed (arg:7)
task running task (arg:8)
task running task (arg:5)
task completed (arg:23)
task completed (arg:22)
task completed (arg:20)
task running task (arg:9)
task running task (arg:10)
task running task (arg:27)
MASTER CANCEL
task running task (arg:11)
task running task (arg:25)
task running task (arg:24)
task running task (arg:12)
prematurely end tasks job

20 of 30 FINISHED 00:00:08.4003803

01234567890123456789012345678
XXXXX-XX-----XXXXXXXXXXX--X-X
```