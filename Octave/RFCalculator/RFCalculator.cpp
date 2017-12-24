// Program for RF Reflection Calculations
// Written by Matthew Santos
// ID: 103103503

#include <string>
#include <iostream>
#include <list>
#include <iterator>

using namespace std;

#define MAX_DISTANCE 100 // meters
#define MIN_DISTANCE 1 // meters
#define DISTANCE_INC 0.1 // meters


int main(){
  //Create Distance Array
  int distance[MAX_DISTANCE];
  for (int i=MIN_DISTANCE;i<MAX_DISTANCE;i+DISTANCE_INC){
    distance[i]=i;
  }
  //Get Material Array
  //get material properties from spreadsheet file

}
