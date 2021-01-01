# tuple value read write

Sometime for a quick obj data saving you don't declare a class but want to use a named ValueTyple; you can modify tuple member values but if you retrieve the tuple from some collection such as a List or a Dictionary the one returned is a copy ( because a ValueType );

An helper class ( available also in netcore-util package ) ValueObj<T> allow you to maintain valuetype reference integrity.

```csharp
using System.Collections.Generic;

namespace tupletest
{

    public class ValueObj<T>
    {
        public T Value;
        public ValueObj(T x) { Value = x; }
    }

    class Program
    {
        static void Main(string[] args)
        {
            {
                var lst = new List<(int x, int y)>();

                lst.Add((1, 2));

                var a = lst[0];

                a.x = 10;

                System.Console.WriteLine($"write not reflected to list element lst[0].x = {lst[0].x}");
            }

            {
                var lst = new List<ValueObj<(int x, int y)>>();

                lst.Add(new ValueObj<(int x, int y)>((1, 2)));

                var a = lst[0];

                a.Value.x = 10;

                System.Console.WriteLine($"write reflected to list element lst[0].Value.x = {lst[0].Value.x}");

            }

        }
    }
}
```

produces follow result:

```
write not reflected to list element lst[0].x = 1
write reflected to list element lst[0].Value.x = 10
```
