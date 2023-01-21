# csharp trap ctrl+c

Notes:
- if pass `cts.Token` to Task.Delay then the operation "listen" for cancellation and interrupt delay immediately if ctrl+c issued ( or SIGINT )
- there is the need to try/catch the `OperationCanceledException` when passing `cts.Token` in order to handle the case of interruption
- for example the following code will generate an exception if insert `cts.Token` on the `Task.Run` or `Task.Wait` methods but for the purpose we don't need to interrupt the task itself neither its waiting because the inner loop closes regularly thanks to `while (!cts.IsCancellationRequested)`

```csharp
namespace example;

class Program
{
    static void Main(string[] args)
    {
        System.Console.WriteLine($"start");

        var cts = new CancellationTokenSource();

        Console.CancelKeyPress += (a, b) =>
        {
            b.Cancel = true;
            cts.Cancel();
            System.Console.WriteLine($"application shutdown requested");
        };
        
        Task.Run(async () =>
        {
            while (!cts.IsCancellationRequested)
            {
                try
                {
                    await Task.Delay(1000, cts.Token);
                }
                catch (OperationCanceledException)
                {
                }
            }
        }).Wait();

        System.Console.WriteLine($"application ended");
    }
}
```