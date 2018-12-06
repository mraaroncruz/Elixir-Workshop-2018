## The Actor Pattern

Elixir uses the Actor Pattern to model it's concurrency story.

Processes communicate with each other by sending messages to each other's mail boxes.

Reading from a mailbox blocks until a message is available.



### How it works

![Actor.001](./images/Actor.001.png)

![Actor.002](./images/Actor.002.png)

![Actor.003](./images/Actor.003.png)

![Actor.004](./images/Actor.004.png)

![Actor.005](./images/Actor.005.png)

![Actor.006](./images/Actor.006.png)

----------------

#### [Dealing With State >>](./state.md)