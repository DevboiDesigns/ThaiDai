import data from "./data.json" assert { type: "json" }

const newData = data.map((i) => {
  i.english = "" + i.english
  return i
})

console.log(newData)
