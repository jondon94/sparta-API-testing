# sparta-API-testing
### Postcode API classwork

**Introduction**

>This file contains an introduction to APIs and their framework, specifically how to call certain information from online for testing. The purpose of this was to learn how to conduct efficient Unit Tests on apps created by other people.

**Walkthrough**

>The contents of these files are written in Ruby and uses RSpec for testing the components. To see the data that the code is pulling from the API, uncomment the section of code at the bottom of single_postcode_service.rb or multi_postcode_service.rb. Then run the file by typing;

>**ruby [folder_location/file_location.rb]**

>In to the console.
To test the file, ake sure your current location in the
console is in the 'root' folder, and then type;

> **rspec**

>When the test is run, a series of red or green lines will appear on the console. A Red line indicates a specific test has failed. A green line means the test passed.

**Instructions**

>To add a new test to the process, firstly identify what it is you would like to test. The type of information presented is a good place to start;
>>Firstly go to the appropriate file in lib/services/... and add a new function(def ... end) to the file before the;

>>call = MultiPostcodesService.new

>>or

>>call = SinglePostcodesService.new.

>> After you have named the function, input the correct information you wish to pull, for instance;

>>def get_single_postcodes_nuts

>>  get_result['nuts']

>>end

>>And after p call.get_single_postcode("ch49pf") type in;

>>p call.get_single_postcodes_nuts

>>After the result of call.get_single_postcode("ch49pf") the result of the nuts hash will be displayed.
This can be continued in this manner for testing the reuslts of all the parameters. Attributes of the parameters can also be tested by adding correct calling functions like .length to the end of the code inside the new function. Some examples of this are .class .length .count.

**Comments**

>This work was very difficult to initially get my head around, however, breaking up the process of outputting a value in the console in to steps and keeping track of which function is being called helps the process. After a while, a lot of the work becomes copying and pasting the correct information.
