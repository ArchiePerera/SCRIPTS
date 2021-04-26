require 'rspec'
require 'pry'
require 'rubocop'
require 'nokogiri'
require 'watir'

  #ARVG input
  def check_user_setting
    abort("missing input : need name_dir, name_file without extension") if ARGV.empty?
  end
  
  #folder_name
  def name
    return ARGV.first
  end
  
  #file_name
  def file_name
    return ARGV.last
  end
  
  #Create directories for ruby's project 
  def create_directories(name_param)
    Dir.mkdir("/home/user/Desktop/#{name_param}")
    Dir.mkdir("/home/user/Desktop/#{name_param}/lib")
  end
  
  #installing rspec for testing && dotenv in case of using API
  def create_test_env(name_param)
    system("cd /home/user/Desktop/#{name_param} && rspec --init")
    system("cd /home/user/Desktop/#{name_param} && touch .env")
  end
  
  #creating Gemfile
  def create_gemfile(name_param)
    file = File.open("/home/user/Desktop/#{name_param}/Gemfile", "w+")
    file.puts "source 'https://rubygems.org'"
    file.puts "ruby \'2.7.1\'"
    file.puts "require \'rspec\'"
    file.puts "require \'pry\'"
    file.puts "require \'rubocop\'"
    file.puts "require \'nokogiri\'"
    file.puts "require \'watir\'"
    file.close
  end
  
  #installing bundle
  def create_bundle(name_param)
    system("cd /home/user/Desktop/#{name_param} && bundle install")
  end
  
  #create a file in vscode with required elements
  def create_file(name_param, file_name_param)
    file = File.open("/home/user/Desktop/#{name_param}/lib/#{file_name_param}" + ".rb", "w+")
    file.puts "require \'rspec\'"
    file.puts "require \'pry\'"
    file.puts "require \'rubocop\'"
    file.puts "require \'nokogiri\'"
    file.puts "require \'watir\'"
    file.close
  end
  
  #open the file with vscode
  def open_file(name_param, file_name_param)
    system("cd /home/user/Desktop/#{name_param}/lib && code #{file_name_param}" + ".rb")
  end
  
  #create a spec file with relative required element
  def create_file_spec(name_param, file_name_param)
    file = File.open("/home/user/Desktop/#{name_param}/spec/#{file_name_param}" + "_spec.rb", "w+")
    file.puts "require_relative \'../lib/#{file_name_param}" + ".rb\'"
    file.close
  end
  
  #create README file
  def create_readfile(name_param)
    file = File.open("/home/user/Desktop/#{name_param}/README.md", "w+")
    file.puts "written by archie for the hacking project"
    file.close
  end
  
  #create dotenv file
  def create_dotenv(name_param)
    system("cd /home/user/Desktop/#{name_param} && touch .env")
  end
  
  #create gitignore
  def create_gitignore(name_param)
    file = File.open("/home/user/Desktop/#{name_param}/.gitignore", "w+")
    file.puts ".env"
    file.close
  end
  
  #Initialize git
  def git_init(name_param)
    system("cd /home/user/Desktop/#{name_param} && git init")
  end
  
  #perform this marvellous script
  def perform
    check_user_setting
    name
    file_name
    create_directories(name)
    create_test_env(name)
    create_gemfile(name)
    create_bundle(name)
    create_file(name, file_name)
    open_file(name, file_name)
    create_file_spec(name, file_name)
    create_readfile(name)
    create_dotenv(name)
    create_gitignore(name)
    git_init(name)
  end
  
  perform
  
  # create an alias