
# README
Conway's Game of Life

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.7.1
* How to run the script
    * ruby game_of_life.rb
* Types: 
    * Currently it supports 4 types=[block, toad, blinker, random], by default it goes with :blinker type.
    To verify different types, please pass type parameter while running script
    Ex: ruby game_of_life.rb toad
* Predefined values

    * @@x = 6 (rows)
    
    * @@y = 6 (columns)
    
    * @@oscillator_count = 50 (times it oscillates)
    
    * type = :blinker (default type, if type parameter is not passed) 
* Note: Added type called "random" which will pick random values to verify the script with different combination    
* Sample outputs
    * ruby game_of_life.rb  
      
    Considering default type :blinker
    
    ----------1-----------
    
    ......
    
    ......
    
    .111..
    
    ......
    
    ......
    
    ......
    
    ----------2-----------
    
    ......
    
    ..1...
    
    ..1...
    
    ..1...
    
    ......
    
    ......
    
    * ruby game_of_life.rb block
    
    ----------1-----------
    
    ......
    
    .11...
    
    .11...
    
    ......
    
    ......
    
    ......
    
    ----------2-----------
    
    ......
    
    .11...
    
    .11...
    
    ......
    
    ......
    
    ......
    
* ...