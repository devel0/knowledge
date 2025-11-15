# ef core transaction

```cs
await using var transaction = await dbContext.Database.BeginTransactionAsync(cancellationToken);

try
{
    // some stuff        

    await dbContext.SaveChangesAsync(cancellationToken);

    await transaction.CommitAsync(cancellationToken);

}
catch (Exception ex)
{
    await transaction.RollbackAsync(cancellationToken);
}
```