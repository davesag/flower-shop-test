# flower-bundler — Cogent Developer Test

This is [Dave Sag](http://cv.davesag.com)'s implementation of [Cogent](http://www.cogent.co)'s developer test.

*If you have been asked to do this test I urge you to not to copy my, or anyone else's, work.*

[![Build Status](https://travis-ci.org/davesag/flower-shop-test.svg?branch=master)](https://travis-ci.org/davesag/flower-shop-test) [![Code Climate](https://codeclimate.com/github/davesag/flower-shop-test/badges/gpa.svg)](https://codeclimate.com/github/davesag/flower-shop-test) [![Test Coverage](https://codeclimate.com/github/davesag/flower-shop-test/badges/coverage.svg)](https://codeclimate.com/github/davesag/flower-shop-test/coverage)

## Declaration

I solemnly declare that I did not copy this code from anyone else, and that it's all my own original  work.

## Approach

I selected `Ruby version 2.2.2` as the language to write this in, which is fair given I am pitching for a `Ruby` focused job.

I started by converting the requirements into a simple suite of `rspec` tests set to `pending` just to get down everything I figured I'd need.

I used [FactoryGirl](https://github.com/thoughtbot/factory_girl) to define the flower / bundle combinations defined in the brief and used this to guide my overall system design.

I have adopted a 'simplest thing that works' approach and, as such, avoided using any sort of object persistence, instead defining a simple `catalogue` object which is capable of looking up flowers by their codes.

## Design

The flower bundler problem is a derivative of the classic [knapsack problem](http://en.wikipedia.org/wiki/Knapsack_problem), with the constraint that the returned bundles **must** comprise of the number of flowers requested, and you may use multiple copies of a bundle.

I have defined the following classes, all namespaced within a `FlowerBundler` module.

* `Catalogue` — a singleton that allows flowers to be added and searched.  This takes the place of any kind of object persistence.
* `FlowerBundle` — holds details of the flower count and price for a bundle of flowers.
* `Flower` — has a name, code, list of bundles, and a `choose_bundles` method that implements the core bundle selection logic.
* `Order` — a simple customer order that can be created via `Order.parse`
* `OrderResult` — container for the processed result of an order
* `Receipt` — a collection of order results with a copy of the initial customer order string and the total price.  This can be output to formatted text via its `to_formatted` method.

The `FlowerBundler` module itself exposes a `process_order` method, the high-level input interface to the system. It returns a result in the form of a `Receipt`, containing one or more `OrderDetails`.

## Bundle selection logic.

### The problem can be restated as follows:

* Let `b1` … `bn` be bundles of flowers (integers > 0) where `n` is the bundle number.
* And let `x1` … `xn` be numbers of bundles (integers >= 0)
* The customer requests `F` flowers (integer > 0)
* And there is an upper bound `N` (`n` <= `N`)
* so `x1 * b1 + x2 * b2 + … xn * bn = F`
* `b1` … `bn`, `F` and `N` are known
* Reject `F` if no combination of `x1` * `b1` + `x2` * `b2` + … `xn` * `bn` can equal `F`
* and optimise `x1` … `xn` such that `n` is minimised.

### Solution

1. sort `bn` … `b1` from highest to lowest
2. create empty stash
3. reject all `bn` where `bn` > `F` so the bundles are now `bn'` … `b1` and `F` must now be >=  `bn'`
4. if there are no bundles left then retry from the top but without `bn`. (but if there is nothing to retry with then exit with an error.)
5. `count = integer `F` / `bn'`
6. add `count` copies of `bn'` to stash
7. if `F` / `bn'` is an integer then exit with stash
8. `F'` = `F` - `count` * `bn`
9. repeat from 3

## Setup

There are a few dependencies so first run

```sh
bundle
```

## To run

The test itself in the form of a suite of `rspec` tests and can be run via the default rake task:

```sh
rake
```

I've also added a simple command line app `flower_shop_app`

```sh
ruby flower_shop_app.rb XX YYY
```

where `XX` is some number and `YYY` is one of the following valid Flower codes

* `R12`
* `L09`
* `T58`

It will either return a receipt, or an error if it can't construct a valid set of Flower Bundles.

## To do

* add some unhappy path tests
* refactor the class and property names to be more consistent and more in-line with Ruby standards.

## License

Even though you are not meant to copy this if doing a test; I'm not at all precious about it, and hey, it's not my test, just my stab at it.

The MIT License (MIT)

Copyright (c) 2015 Dave Sag

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

The file in the `brief` folder was supplied by [Cogent](http://www.cogent.co) and so naturally the copyright of that remains with Cogent. It is included here under "fair use" provisions of [section 40 of the Australian Copyright Act 1968](http://www.austlii.edu.au/au/legis/cth/consol_act/ca1968133/s40.html) to give context to the code base.
