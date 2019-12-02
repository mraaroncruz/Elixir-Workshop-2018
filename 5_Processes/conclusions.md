## What we learned

- Elixir uses Processes as and the Actor Pattern as its concurrency model.
- You can easily spin up thousands or millions of processes as they have a very tiny overhead (~ 2k).
- The BEAM scheduler takes care of making sure that code that runs in processes is run in parallel, not just concurrently like in most mainstream scripting languages.
- Everything runs in a Process.
