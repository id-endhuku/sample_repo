def get_value(obj, key):
  keys = key.split("/")
  current = obj
  for k in keys:
    if k not in current:
      return None
    current = current[k]
  return current

obj = {
  "a": {
    "b": {
      "c": "d"
    }
  }
}

print(f'Value = {get_value(obj, "a/b/c")}')  # prints "Value = d"
print(get_value(obj, "a/b/d"))  # prints None
