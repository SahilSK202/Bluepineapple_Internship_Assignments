// 6. In JavaScript ES6 an arrow function expression is a syntactically compact alternative to a regular function expression. Create a function that takes a string representing a function and converts between an arrow function and a regular function

// - If the input is a regular function, return an equivalent arrow function.

// - If the input is an arrow function, return an equivalent regular function.

function arrow_to_regular(fn_str) {
  let arr = fn_str.split("{");
  let body = arr[1]; // storing body part of the function
  arr = fn_str.split(" ");

  arr = arr.filter((element) => {
    return element !== "";
  }); // removing blank strings from array

  return (
    arr[0] + " " + arr[1] + " function(" + arr[2].split("(")[1] + " {" + body
  );
}

function regular_to_arrow(fn_str) {
  let arr = fn_str.split("{");
  let body = arr[1]; // storing body part of the function

  arr = arr[0].split(" ");

  arr = arr.filter((element) => {
    return element !== "";
  }); // removing blank strings from array

  return arr[0] + " " + arr[1] + " (" + arr[2].split("(")[1] + " => {" + body;
}

function functionConverter(fn_str) {
  if (fn_str.includes(">")) {
    return arrow_to_regular(fn_str);
  } else {
    return regular_to_arrow(fn_str);
  }
}

let fn_str1 = `function_name1 = function(...params) {
// function body and business logic
}`;
let fn_str2 = `function_name2 = (...params) => {
// function body and business logic
}`;

console.log(functionConverter(fn_str1));
console.log(functionConverter(fn_str2));
