#!/usr/bin/env bats

@test "invoking geturls.sh with parameter google.com" {
  run ./geturls.sh https://www.google.com 
  [ "$status" -eq 0 ]
}

@test "invoking geturls.sh with parameter google.com and file name" {
  run ./geturls.sh https://www.google.com get-urls.txt
  [ "$status" -eq 0 ]
}

@test "invoking geturls.sh without default url" {
  run ./geturls.sh
  [ "$status" -eq 1 ]
  [ "$output" = "Default url doesn't exit" ]
}

@test "invoking geturls.sh and checking if list.txt exists or not" {
  run ./geturls.sh https://www.google.com
  [ "$status" -eq 0 ]
  [ -f list.txt ]
  result=$?  
  
  [ "$result" -eq 0 ]
}

@test "invoking geturls.sh and checking if get-urls.txt exists or not" {
  run ./geturls.sh https://www.google.com get-urls.txt
  [ "$status" -eq 0 ]
  [ -f get-urls.txt ]
  result=$?  

  [ "$result" -eq 0 ]
}