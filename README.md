# reward_system

## Objective
Implement a system for calculating rewards based on recommendations of customers.

## Problem Statement
A company is planning a way to reward customers for inviting their friends. They're planning a reward system that will give a customer points for each confirmed invitation they played a part into. The definition of a confirmed invitation is one where an invited person accepts their contract. Inviters also should be rewarded when someone they have invited invites more people.
The inviter gets (1/2)^k points for each confirmed invitation, where k is the level of the invitation: level 0 (people directly invited) yields 1 point, level 1 (people invited by someone invited by the original customer) gives 1/2 points, level 2 invitations (people invited by someone on level 1) awards 1/4 points and so on. Only the first invitation counts: multiple invites sent to the same person don't produce any further points, even if they come from different inviters and only the first invitation counts.
So the input of
  2018-06-12 09:41 A recommends B
  2018-06-14 09:41 B accepts
  2018-06-16 09:41 B recommends C
  2018-06-17 09:41 C accepts
  2018-06-19 09:41 C recommends D
  2018-06-23 09:41 B recommends D
  2018-06-25 09:41 D accepts
would calculate as:
- A receives 1 Point from the recommendation of B, 1⁄2 Point from the recommendation of C by B and
another 1⁄4 Point by the recommendation of D by C. A gets a total score of 1.75 Points.
- B receives 1 Point from the recommendation of C and 1⁄2 Point from the recommendation of D by C.
B receives no Points from the recommendation of D because D was invited by C before. B gets a
total score of 1.5 Points.
- C receives 1 Point from the recommendation of D. C gets a total score of 1 Point.

## Solution
To solve problem created a reward_system gem

## How to use
You can use this gem as by following ways
### 1. Installing to your local machine by following commands

```
git clone https://github.com/Satkar/reward_system.git
```
Navigate to the reward_system folder and run
```
gem build reward_system.gemspec

gem install reward_system-0.0.1.gem
```
check if gem is installed in you machine by a command
```
gem list | grep reward_system
```
Once gem is installed as shown you can require it in your file as shown in file [process_reward](https://github.com/Satkar/reward_system/blob/master/process_reward.rb#L3)

### 2. As a library
```
git clone https://github.com/Satkar/reward_system.git
```
add
```
require './lib/operation.rb'
```
in the file in which you want to consume this library and comment the [line](https://github.com/Satkar/reward_system/blob/master/process_reward.rb#L3)

*Note:* Above require statement holds good only if consumer file is in the reward_system directory that you have cloned. Else change the path as needed.

## Sample
To check how does this gem works [sample consumer](https://github.com/Satkar/reward_system/blob/master/process_reward.rb)

## Limitation of sample consumer
It only process a txt file with below content format
 ```
 2018-06-12 09:41 A recommends B
 2018-06-14 09:41 B accepts
 2018-06-16 09:41 B recommends C
 2018-06-17 09:41 C accepts
 2018-06-19 09:41 C recommends D
 2018-06-23 09:41 B recommends D
 ```

 ## Reference for sample
 - [Consumer](https://github.com/Satkar/reward_system/blob/master/process_reward.rb)
 - [File](https://github.com/Satkar/reward_system/blob/master/reward_file.txt)
