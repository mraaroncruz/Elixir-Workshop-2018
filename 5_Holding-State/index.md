## #nomorethreads

There is a big difference between concurrent and parallel.

Ruby is concurrent (with threads)

JavaScript is concurrent (with the reactor pattern)

Neither of these languages are actually run things in parallel though, meaning running two pieces of code at exactly the same time. They are both single threaded.

You can get around this by starting multiple processes but the processes are huge and carry a ton of RAM and processing overhead with them.

### Parallelism as a first class citizen

In Elixir everything is running in an Elixir `process`. When you start up a REPL, it is running in a process.

**Let's kill it!**

### !! Demo !!

You can run millions of them and they have a very small overhead. The BEAM scheduler will see how many processors you have and distribute work across them all. If you have 128 processors, the scheduler will just automatically use all of them if you have at least that many processors running.

---------------------

#### [The Actor Pattern >>](./concepts/index.md)

