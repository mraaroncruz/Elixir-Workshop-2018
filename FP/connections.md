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



## OOP Todo List

So let's say we have a todo list. Let's figure out our API.

Here's our `Todo` class:

```ruby
class Todo
    attr_accessor :description, :is_complete
    def initialize(description)
        @description = description
        @is_complete = false
    end
    
    def complete
        @is_complete = true
    end
end
```

Now we need something to model our list. Let's cal it `Todos`:

```ruby
class Todos
    attr_reader :todos
    def initialize
        @todos = []
    end
end
```

And we need some methods to add and remove our todos.

```ruby
class Todos
    attr_reader :todos
    def initialize
        @todos = []
    end
    
    def add(description)
        @todos << Todo.new(description)
    end
    
    def remove(todo)
        @todos.delete(todo)
    end
end
```

And we want to be able to display our todos:

```ruby
class Todos
    #....
    
    def to_s
        puts "## Our Todos ##"
        puts "###############"
        todos.each do |todo|
            puts "[#{todo.is_complete ? 'x' : ' '}] #{todo.description}"
        end
        puts "###############"
    end
end
```

## Demo

