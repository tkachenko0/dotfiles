class Observer {
  constructor() {
    this.callbacks = [];
  }

  subscribe(callback) {
    this.callbacks.push(callback);
  }

  publish(value) {
    for (let callback in this.callbacks) {
      callback(value);
    }
  }
}

const obs = new Observer();

obs.subscribe((val) =>
  console.log(`From subscription -2, the value is ${val}`),
);
obs.subscribe((val) => console.log(`From subscription 2, the value is ${val}`));
