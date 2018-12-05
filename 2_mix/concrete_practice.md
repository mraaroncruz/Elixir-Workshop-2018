## mix Exercises

We will need a mix project for the next section.

Your job will be to generate a mix project and add the two dependencies we need for the next section.



## The Dependencies

Here are the dependencies we will need. Add them to your `./mix.exs` file.,

Make sure you fetch them with `mix deps.get`

After you install the dependencies, you can run `iex -S mix` to run your app code in a REPL.



### HTTP client (HTTPoison)

We need an HTTP client to talk to the internet.
There are some good ones but I prefer HTTPoison

https://github.com/edgurgel/httpoison



### HTML Parser (folk)

We'll be parsing some HTML. Instead of doing something CRAZY like using regexp's, we'll grab a dependency from github that gives us a really nice API to dig into our documents.

https://github.com/philss/floki



## Play around

Once you get the deps installed, make some requests.

- Hit google.at
- See what the response looks like (hint: It follows an Elixir error handling convention)
- Create an error, what happens?
- Turn off WIFI. What happens?
- Take the response body and use `floki` to play around with the response
- What does floki do with strange input (like `nil`). How would you expect it to work?



### Note

You can run `mix help` to get a list of all your mix commands.

```bash
~/proj ❯❯❯ mix help                                                                                                      
mix                   # Runs the default task (current: "mix run")
mix app.start         # Starts all registered apps
mix app.tree          # Prints the application tree
mix archive           # Lists installed archives
mix archive.build     # Archives this project into a .ez file
mix archive.install   # Installs an archive locally
mix archive.uninstall # Uninstalls archives
mix clean             # Deletes generated application files
mix cmd               # Executes the given command
mix compile           # Compiles source files
mix deps              # Lists dependencies and their status
mix deps.clean        # Deletes the given dependencies' files
mix deps.compile      # Compiles dependencies
mix deps.get          # Gets all out of date dependencies
...
```

