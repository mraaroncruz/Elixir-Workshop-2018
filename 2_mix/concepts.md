## Some basic commands

- `mix new project_name`

Creates a project folder in the current directory. This project contains a `mix` application structure following a convention that ensures that your project files and external dependencies are all properly included and compiled.

* `mix new project_name --sup`

Same as above but creates a top level `Supervisor` that can control your process tree.

- `mix test`

Runs the tests in your generated tests folder and doctests if they are enabled.

* `mix deps.get`

Fetches and compiles external dependencies. Two popular places to fetch these from are `hex` and github.com.

* `mix compile`

Compiles your source files to files the BEAM (Erlang Virtual Machine) can read. It writes them to the `./deps` directory in the root of your mix project.



## The REPL (iex)

Elixir has its own REPL (Read Eval Print Loop) similar to `irb` or `pry`  in Ruby or running `node` from the command line in the JS world.

To run the REPL and play around run

`iex`

From the command line.

Or run

`iex -S mix`

to run a REPL but with all of your project files included and Supervisors started.



### [To exercises >>](./concrete_practice.md)