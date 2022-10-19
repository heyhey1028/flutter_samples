
// basic example
function basicFunction() {
    console.log("function executed!")
}

// example with arguments
function functionWithArg(arg) {
    console.log(`argument ${arg} was provided!`)
}

// function using library
function functionUsingLibrary(list){
    // using max method from lodash
    console.log(`biggest number is ${_.max(list)}`)
}

// example with object arguments
function functionWithObjectArg(obj) {
    console.log(`object was provided!\n${JSON.stringify(obj, null, 2)}`)
}

// example with passing function
function functionWithFunctionArg(func) {
    const result = func()
    console.log(`function result was ${result}`)
}

// example with Promise function
async function functionWithPromise() {
    console.log("execution started")
    await new Promise(resolve => {
        setTimeout(resolve, 3000) // wait 3 seconds
      });
      console.log("call waited 3 seconds")
}
