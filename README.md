Kaiten Simulation
=================

Background
----------

In the anime Naruto, Hyuga Neji has an ultimate technique where he rotates very quickly while releasing a large amount of chakra.  This causes a spherical vortex of air and chakra that can deflect pretty much any attack.  [Here](http://www.youtube.com/watch?v=xotUq5VzEts) is an example of what kaiten looks like in the Naruto anime.


Question
--------

How fast would Hyuga Neji have to be rotating in order to deflect an actual projectile?


Assumptions and Parameters
--------------------------

* Chakra is essentially massless
* The air around Neji becomes imbued with chakra and rotates quickly
* This rotating air can be modeled as a vector field

The dimensions of the system are currently hard coded into the classes themselves.  If you would like to adjust the size and speed of the kaiten or the size and speed of the projectile, you should edit "lib/kaiten.rb" and "lib/kunai.rb" respecitvely.


Running the Simulation
----------------------

Simply use the following command to run the simulation:

    rake run

This will create an output file called "output.txt" with three columns corresponding to the x-, y-, and z- positions of the kunai as a function of time.