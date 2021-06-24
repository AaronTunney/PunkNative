# PunkNative

A native Swift Package for the [Punk API](https://punkapi.com) beer recipe database.

## How to use

`PunkNative` offers two styles of API:

1. `async`/`await` (iOS 15+)
1. Combine

### Async/await

Create an instance of `PunkNative` and call the `beers` method, passing zero or more parameters:

```swift
    let punkNative = PunkNative()
    let parameters: [BeersParameter] = [.abvGreaterThan(value: 5.0)]
    let beers = try await punkNative.beers(parameters: parameters)
```

### Combine

Create an instance of `PunkNative` and subscribe to the `beers` method, passing zero or more parameters:

```swift
    let punkNative = PunkNative()
    let parameters: [BeersParameter] = [.abvGreaterThan(value: 5.0)]
    punkNative.beers(parameters: [parameters])
        .sink { complete in
            switch complete {
                // Handle completion
            } receiveValue: { beers in
                // Handle value
            }
        .store(in: &disposables)
```
