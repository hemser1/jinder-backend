# [Jinder](http://jinder-frontend.herokuapp.com/):tm:
![Jinder2](https://user-images.githubusercontent.com/42152431/64331487-cbbcc400-cfca-11e9-991f-acc81c28448b.png)

A backend Rails API repository for Jinder (Job Tinder) - a job app that aims to make recruitment more fun and human for both candidates and employers. Created by 4 [Makers Academy](https://makers.tech/) students in their 11th and 12th weeks of learning to code. Deployed live [on Heroku](https://jinder-backend.herokuapp.com)

## Tech Stack Used
- Rails API with Devise for candidate and employer signing up and logging in
- RSpec for tests (>95% coverage)
- Circle CI for CI/CD
- Heroku for deployment
- AWS S3 for image database
- React for [frontend](https://github.com/zi-codes/jinder-frontend)

## Run it yourself

#### Mac OS
In terminal (requires ruby and bundler installed):
```sh
$ git clone https://github.com/hemser1/jinder-backend
$ cd jinder-backend
$ bundle
$ rake db:create
$ rake db:migrate
$ rails s
```
This will then start a server for the backend which you can then make HTTP requests to via Curl, Insomnia, Postman or your own frontend. 

#### To run the test suite
In the project directory:
```sh
$ rspec
```

#### To view routes for HTTP requests
In the project directory:
```sh
$ rails routes
```
Each route accept a JSON request and will produce a JSON response with the corresponding success/error code. 

### Example request bodies and responses:

#### Creating a user (POST to http://localhost:3000/users)
Body should contain JSON formatted as:
```sh
{ 
	"user": 
	{
		"email": "new@test",
		"password": "123456"
	}
}
```

Response on success (note this is an example token, not actually valid):
STATUS: 201 CREATED
```sh
{
  "id":7,
  "email":"new@test.com",
  "authentication_token":"VAo6qws_1DdJeFm7HsxJ"
}
```

#### Creating a profile (POST to http://localhost:3000/api/profiles)

Body should contain JSON formatted as:
```sh
{
	"profile": {
		"first_name": "Test",
		"last_name": "McTest",
		"industry": "Software Engineering",
		"user_id": 1,
	}
}
```

Response on success:
STATUS: 201 CREATED
```sh
{
    "id": 1,
    "first_name": "Test",
    "last_name": "McTest",
    "user_id": 1,
    "industry": "Software Engineering",
    "user": {
        "id": 53,
        "email": "candidates@matches.com",
        "created_at": "2019-09-10T17:18:35.940Z",
        "updated_at": "2019-09-10T17:24:15.629Z",
        "accepted_employers": [],
        "rejected_employers": []
    }
}
```

#### Signing in (POST to http://localhost:3000/api/sessions)

Body should contain JSON formatted as:
```sh
{
	"email": "candidates@matches.com",
	"password": "111111"
}
```

Response on success:
STATUS: 201 CREATED
```sh
 {
    "id": 53,
    "email": "candidates@matches.com",
    "created_at": "2019-09-10T17:18:35.940Z",
    "updated_at": "2019-09-10T17:24:15.629Z",
    "accepted_employers": [],
    "rejected_employers": []
 }
```

#### Retrieving all profiles (GET to http://localhost:3000/api/profiles)

No body required for the request.

Response on success:
STATUS: 200 OK
```sh
[
  {
    "id": 51,
    "first_name": "Another",
    "last_name": "TestUser",
    "user_id": 86,
    "industry": "Software Engineering",
    "skills": "C#",
    "user_bio": "I love Jinder.",
    "location": "London",
    "personality": "Leader",
    "user": {
      "id": 86,
      "email": "qweq@poewkwepe.com",
      "created_at": "2019-09-12T10:16:09.242Z",
      "updated_at": "2019-09-12T10:16:09.242Z",
      "accepted_employers": [],
      "rejected_employers": []
    },
    "image_photos": [
      {
        "url": IMG_URL_HERE,
        "name": "20190810_145521.jpg",
        "id": 12
      }
    ]
  }
]

```
