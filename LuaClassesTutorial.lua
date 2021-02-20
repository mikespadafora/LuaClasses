
-- This is the first step in using Object Oriented Programming practices in the LUA language. OOP (Object Oriented Programming)
-- is a great way to cut down on the amount of code you have to write and an elegant way to organize code to make it run more efficiently.


-- To create a new class, create a table with the name of the class.

Car = {
  -- Inside of the table, assign members or properties of that class.
  maxSpeed,
  color,
  make,
  model,
  prettyName
}


-- Create a function that will allow variables outside of this class to instantiate this class
-- To create functions within a class the function must be named be defined like this: function <class name>:<function name>()

function Car:New() -- This function can now be called inside of a variable and that variable will be able to access members/functions of this class
  local object = {}
  setmetatable(object, self)
  self.__index = self
  return object
end

function Car:GetPrettyName()
  local prettyName = self.make.." "..self.model
  return prettyName
end

function Car:CarInfo()
  local info = string.format("My new %s %s is the color %s and can go as fast as %d miles per hour!", self.make, self.model, self.color, self.maxSpeed)
  return info
end


-- Below is the main code outside of the above class

-- First instantiate the class above inside of a variable. Do this by calling the Car:New() function 

MyFirstCar = Car:New()

-- Now your new variable called 'MyFirstCar' has access to all of the variables and functions created in the 'Car' class. This is an OOP practice called Inheritance

MyFirstCar.maxSpeed = 210
MyFirstCar.color = "yellow"
MyFirstCar.make = "Dodge"
MyFirstCar.model = "Challenger"
MyFirstCar.prettyName = MyFirstCar:GetPrettyName()

MyFirstCarInfo = MyFirstCar:CarInfo()


-- You can instantiate the "Car" class as many times as you want and that instance will have its own unique properties

MySecondCar = Car:New()

MySecondCar.maxSpeed = 60
MySecondCar.color = "red"
MySecondCar.make = "Ford"
MySecondCar.model = "Model T"
MySecondCar.prettyName = MySecondCar:GetPrettyName()

MySecondCarInfo = MySecondCar:CarInfo()


-- By printing the two new strings below, you can see that both instances of the car class have their own unique properties!

print(MyFirstCarInfo)
print(MySecondCarInfo)

-- Now you can perform functions using properties from each new instance of the Car class!

function Race(name1, speed1, name2, speed2)
  local intro = string.format("The race is starting between the %s and the %s. Let's see who will win!", name1, name2)
  print(intro)

  if speed1 > speed2 then
    return name1
  elseif speed1 < speed2 then
    return name2
  else
    return "Tie"
  end
end

RaceWinner = Race(MyFirstCar.prettyName, MyFirstCar.maxSpeed, MySecondCar.prettyName, MySecondCar.maxSpeed)

print("The winner of the race is: "..RaceWinner.."!!!")