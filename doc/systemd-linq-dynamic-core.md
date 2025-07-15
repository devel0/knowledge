# System.Linq.Dynamic.Core

## enable custom db functions to be used

Having
- psql custom function
- used `HasDbFunction` in the `OnModelCreating`
- defined a static method

you need also to add `[DynamicLinqType]` attribute to the class that hold the static method

## references

- [prj](https://github.com/zzzprojects/System.Linq.Dynamic.Core)