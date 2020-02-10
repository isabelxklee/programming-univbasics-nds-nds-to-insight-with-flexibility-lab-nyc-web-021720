# Provided, don't edit
require 'directors_database'
require 'pp'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  index = 0
  new_movie_collection = []
    while index < movies_collection.length do
      new_movie_collection.push(movie_with_director_name(name, movies_collection[index]))
      index += 1
    end

  new_array = []
  counter = 0
    while counter < new_movie_collection.length do 
      new_array.push(new_movie_collection[counter])
      counter += 1
  end 
  new_array
end

  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method

def is_unique(array, studio_name)
  index = 0
  while index < array.length do 
    if array[index] == studio_name
      false
    end 
    index += 1
  end
  true
end 

def gross_per_studio(collection)
  index = 0 
  list_of_studios = []
  result = {}

    while index < collection.length do
      if is_unique(list_of_studios, collection[index][:studio])
        list_of_studios.push(collection[index][:studio])
      end
      index += 1
    end 

    index = 0 
    while index < list_of_studios.length do 
      counter = 0
      studio_gross = 0
      studio_name = list_of_studios[index]
      while counter < collection.length do
        if studio_name == collection[counter][:studio]
          studio_gross += collection[counter][:worldwide_gross]
        end
        counter += 1
      end
      result[studio_name] = studio_gross
      index += 1
    end 
    result
end

  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash

def movies_with_directors_set(source)
  index = 0
  movie_array = []
  result = []

    while index < source.length do
        movies_collection = source[index][:movies]
        director_name = source[index][:name]
    
        movie_array.push(movies_with_director_key(director_name, movies_collection))
        index += 1
    end

    counter = 0 
    while counter < movie_array.length do 
      counter = Array.new(movie_array[counter])
      result.push(counter)
      counter += 1
    end 

  result
end

  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.


# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
