# task programming

- [sample bg task](#sample-bg-task)

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