---
title: Microservices All the Way Down.
subtitle: Exploring the relationship between nature and the architectures we invent.
date: 2016/02/13
excerpt: The Microservices pattern is intensely popular right now in software development, but in other fields it always has been. In a way its even been around in software for longer than we think too.
cover_img: 2016/images/yir2015/cover.gif
public: false
---

## The Omnipresent Microservices Pattern.
Recently I've been part of a major refactor taking a 4 year old code base (so not _that_ old), and changing it over to a pattern that is based on a Microservice Architecture. During this process I took the time to formalize my knowledge by reading Building Microservices (http://shop.oreilly.com/product/0636920033158.do).

> A particular way of designing software applications as suites of independently deployable service <br /><span>— Martin Fowler</span>

_\* Source: http://martinfowler.com/articles/microservices.html ._

If you aren't familiar with microservices, I suggest reading up on them at some point, though you still may be able to get a bit out of this post anyways. Martin Fowlers definition seems to be fairly popular (http://martinfowler.com/articles/microservices.html), and describes the architecutre as "a particular way of designing software applications as suites of **independently deployable services.**"

To me one of the most advantageous parts of this architecture is that you are able to have applications with potentially completely different architectures unto themselves, utilizing unique stacks, communicating with specific third parties, and potentially even running on different(ly configured) hardware. Meaning also that if you need to change one critical part of the product created by the microservices, you can deploy that portion without needing to redeploy everything else. This comes with a bit more overhead for initial configuration, and creating endpoints for communication between services, but I believe its worth it.

While this seems revolutionary, its really something that has been going on in software development in some ways since classes were first written, in physical manufacturing for 2250 years, and in biology for hundreds of millions of years. Making it quite a natural way to design systems.

For the "deployable" part of Fowler's definition (which is the most critical), I am going to discuss with some flexibility, so if you haven't already, grab a shaker of salt, because I may ask you to consume several grains.

## Microservices in micro?

Part of the development process when writing code, regardless of years of experience, should be self-evaluating what you have written. Many programmers, especially those that are more junior, will write individual methods that are far too long, or methods that are have more than a single responsibility.

In a well written class (in object-oriented languages), methods are small and each has a single responsibility. This makes the code more modular, and more maintainable (as when refactoring, you can more easily identify where problems are occurring, especially if you have a good test suite).

Braking apart the code like this has another advantage as well, it also allows more fine grained decisions as to which methods of a particular class will be private or public one instantiated.

Here we can think of the public methods within a class as a sort of API for interacting with that object. We don't want to give other objects too much control or power, or the ability to poke around and see everything going on under the hood, but we need some way for them to communicate together.

Scaling this up, one level, we then have a collection of objects instantiated, working together to perform much more complex tasks, and ultimately coming together to deliver some type of value to either a user or a system.

Scaling this up one more level, would mean having a series of applications working together to perform a similar value-delivering task. This is the essence of microservices. Rather than being something completely unique, its a scaling up of a very familiar development pattern. Now having larger services each responsible for more fine grained tasks, communicating over APIs. And just like one step down in scale, this larger system is still perceived by a user as one cohesive application or experience (even though it may not be), but we have gained the added advantage of modularity now not just in regards to organization, but in environments and deployability as well.

## Physical Engineering and Microservices.

Remember those grains of salt, I talked about earlier? Now is the right time to pop a few in your mouth.

While microservices may seem like a scaling up of already existing software patterns, they are borrowed most likely (probably accidentically) from the objects around us in our everyday life. Im going to talk about NYC subways as a particular example.

Lots has been written about the subway system in New York, its an excellent study on networks and optimized paths. In terms of actual computers, its also run by some *really* legacy systems (http://gothamist.com/2015/07/28/subway_steampunk_video.php). I however want to take a moment to talk about the trains themselves.

The trains that run along the lines of the New York City subway system update quite slowly. I've lived in the city for 8 years and nothing drastically new has rolled out onto the lines (The R188 has been in service on the 7 line since 2011, but is essentially a minor upgrade to the R142A from 2000. Though the R179 is planned to roll out over the next couple years and replace all those old trains with the orange chairs, or R42s as they are labeled (https://en.wikipedia.org/wiki/New_York_City_Subway_rolling_stock)).

These individual trains are replaceable within the city infrastructure by other or newer trains, each quite literally independently deployable into the system. Newer trains integrate directly into the CBTC (https://en.wikipedia.org/wiki/Communications-based_train_control) which essentially networks the trains together to run as a single system.

Where the modularity is lacking however is within individual trains.

### Trains as Systems of Microservices.

Introduction of new trains goes quite slowly, but there are similarities between how all trains work. One of the key similarities is that they receive power from a third rail (https://en.wikipedia.org/wiki/Third_rail) via something called a "shoe". To relate back to software, this is essentially our end point, and the signal (data/etc) that we are sending to it is power in the form of direct current.

Aside from networking with the rail (a third part in this context), cars also communicate with each other sending information and signals to open doors, update maps to show the current stop/travejectory of the train, syncing up start and stop of utilities such as lights and air conditioning and more.

From an engineering point of view, these utilities are most definitely not microservices, as they are pretty wholly integrated into each individual car. But each car  could most definitely be considering its own unique application.

Each car's connectors to the one in from and behind it are the endpoints used within the system to link the services (cars) and to send signals to each other. The difference here being that while any car could talk to any car, we always have a single in and a single out. (If this isn't already a defined software pattern, Ill coin the tern "*Railway Services Architecture*").

> Railway Services Architecture: A microservice-like architecture in which each service only sends data to a single other service, and only requests data from another single different service.

In an ideal world this would allow for train cars to be updated and deployed independently of replacing entire trains. Still require effort and potential "down time" but allowing for less risk in replacing entire systems, and much faster upgrades and integration.

## The Human Interface.

As we move more into the abstract, I would even argue that objects in our everyday life function in this way. As a human being, our 5 senses are essentially our endpoints though which we receive information. We are able to send information via other services such as speech or physical gestures (including hand movements used to write, type, sign, and so forth).

Inadvertently man made objects also have similar relationships, in that to open a bottle I use the "api" (the cap) to access "stored data" (contents of the bottle). Which in the case of the bottle of vitamins I'm currently looking at, I then pass one to my mouth (another api), and process its data internally (my internal organs are like private methods or objects that the outside world doesn't have direct access to).

Even just from this, you can put the pieces together yourself and see that other than my interfacing with other objects (and other humans), that these humans and objects have the ability to communicate with each other as well. While this is certainly a network, its also a perfect example of many products communicating together, each independently deployable (birth/manufacturing), running on different systems, and more. The Earth's surface is a giant complex system running on microservices! It even has fallbacks for individual units via social structures and duplication!

## You.

Jumping the opposite direction from the planetary scale, hopefully you are starting to see where I am going with this. microservices thus far have proven to me that they are a solid architectural pattern. But thats because they mimic just on a larger scale, much the same way we have been writing and defining classes and objects for a while now.

Furthermore, they are reminiscent of physical engineering and even biology and networks. Even our bodies, which are constructed of cells, each communicating to each other to create a whole, have a means of independently deploying new cells (services) without breaking the rest of the system (though sadly we cant naturally do this for larger objects like organs).

While here I talk about microservices, its no surprise than we draw information from nature for everything and at every level. While certain concepts may be a few steps removed, the origin of any idea has to have come from another, and we can trace that all down indefinitely. I'm excited to see where we evolve next with software along this route. What scales up in software after products constructed from microservices? Does the internet itself count, where does a collection of services become to big to qualify for this line of thought? Or too small?
