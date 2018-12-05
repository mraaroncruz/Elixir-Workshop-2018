## Concepts

- Classes are a combination of state and behavior
- Change a user's username
- Check a user's email validity
- `document.print`



## Problems with mutable data

- Parallelism



> If the data is immutable you need to know what it means, where it was first assigned, and perhaps how it is used here.
>
> If the data is mutable you need to know what it means, where it was first assigned, where it can be changed, when it can be changed, if those changes can happen concurrently and require locks, what sequence locks need to be acquired in, if changing the data needs coordination with others, and if it is actually changed here
>
> https://softwareengineering.stackexchange.com/a/133332/101408

