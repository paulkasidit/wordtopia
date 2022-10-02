#### Wordtopia
## By

* Kasidit Srisawat (Paul)

## Technologies Used

* Ruby 
* Rails 
* Rspec
* Sinatra 

## Description

This CRUD web application gives kids the opportunity to expand their vocabularies. Kids have the option to add in words and their associated definitions, and also have the option to either delete/update them as they are further along on their learning journey. 

## Setup/Installation Requirements

- Cloning the repo and running scripts on your local machine

1. Clone the repo to your desired local directory with the below terminal command (you must already have git installed). Open a terminal in your preferred directory and run this command. 
```
git clone https://github.com/paulkasidit/wordtopia

``` 
2. Open this folder in your VS Code. 
3. Run this command to install required dependencies
``` 
$bundle install
```
4. Run this command to start the server, it will usually be hosted on http://localhost:4567/
``` 
$ruby app.rb
```
5. Run tests for all scripts in the project's root directory with following terminal command
``` 
rspec 
``` 

## Known Bugs

* Even if there is no word present, the list still displays an empty bullet point. 

## License

Any inquiries or issues can be reported to _(kasiditpaul@gmail.com)

MIT License

Copyright (c) 2022 Kasidit Srisawat

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