"use strict";
class Shop {
    constructor(_name, _products) {
        this.pointer = 0;
        this.name = _name;
        this.products = _products;
    }
    next() {
        if (this.pointer < this.products.size) {
            return {
                done: false,
                value: [...this.products][this.pointer++],
            };
        }
        else {
            return {
                done: true,
                value: null,
            };
        }
    }
    PriceFilter(lowPrice, topPrice) {
        this.products.forEach(element => {
            if (element.price < topPrice && element.price > lowPrice)
                console.log(element.number);
        });
    }
    SizeFilter(lowSize, topSize) {
        this.products.forEach(element => {
            // element = (Footwear)element;
            if (element.size < topSize && element.size > lowSize)
                console.log(element);
        });
    }
    ColorFilter(color, extra) {
        for (let i = 0; i < arguments.length; i++) {
            this.products.forEach(element => {
                if (arguments[i] == element.color) {
                    console.log(element);
                }
            });
        }
    }
}
var typeoffootwear;
(function (typeoffootwear) {
    typeoffootwear[typeoffootwear["sneakers"] = 0] = "sneakers";
    typeoffootwear[typeoffootwear["boots"] = 1] = "boots";
    typeoffootwear[typeoffootwear["sandals"] = 2] = "sandals";
})(typeoffootwear || (typeoffootwear = {}));
class Product {
    constructor(_number, _price) {
        this.number = _number;
        this.price = _price;
    }
}
class Footwear extends Product {
    get age() {
        return this._discount;
    }
    set discount(n) {
        if (n < 0 || n > 99) {
            console.log("Недопустимое значение скидки!");
        }
        else {
            this._discount = n;
            this._totalPrice = this.price - this.price * this._discount / 100;
        }
    }
    get totalPrice() {
        return this._totalPrice;
    }
    set totalPrice(n) {
        if (n < 0 || n > this.price) {
            console.log("Недопустимое значение стоимости товара!");
        }
        else {
            this._totalPrice = n;
            this._discount = Math.round(this._totalPrice / this.price * 100 - 1);
        }
    }
    constructor(number, _size, _color, price, _type) {
        super(number, price);
        this.number = number;
        this.size = _size;
        this.color = _color;
        this.type = _type;
        this.price = price;
        this._discount = 0;
        this._totalPrice = price;
    }
}
let Boots = new Footwear(1111, 11, "red", 11.99, typeoffootwear.boots);
let Sneakers = new Footwear(2222, 22, "green", 22.99, typeoffootwear.sneakers);
let Sandals = new Footwear(13333, 33, "blue", 33.99, typeoffootwear.sandals);
let prods = new Set;
prods.add(Boots);
prods.add(Sneakers);
prods.add(Sandals);
for (let item of prods) {
    console.log(item);
}
let products = new Set();
products.add(Boots);
products.add(Sneakers);
products.add(Sandals);
let FootwearShop = new Shop("footwearshop", products);
//z3
console.log("---------------zadanie 3");
FootwearShop.PriceFilter(10, 30);
FootwearShop.SizeFilter(20, 30);
FootwearShop.ColorFilter("red");
//z2
console.log("---------------zadanie 2");
let elem = FootwearShop;
let itres1 = elem.next();
let itres2 = elem.next();
let itres3 = elem.next();
let itres4 = elem.next();
console.log(itres1);
console.log(itres2);
console.log(itres3);
console.log(itres4);
console.log("---------------zadanie 5");
//z5
console.log("-------------------");
console.log(Boots.price);
Boots.discount = 10;
console.log(Boots.totalPrice);
console.log("-------------------");
Boots.totalPrice = 5.99;
console.log(Boots);
