# QUIZ TIME!

Fill this out and send the result to `brit@theironyard.com`.
You have until 9:20. This is for practice, not for a grade.

## Section 1 - Short Answer (sentence or two)

```
root to: 'users#index'
```

1. What is the "root" route for a Rails app?
   What controller and method does the above route go to?

```
flash[:notice] = 'who wants more coffee?'
```

2. What does the above code do? Is it reasonable to store things under any key in `flash`?

3. What is the difference between Authentication and Authorization? Which does Devise primarily help with?

4. What are two methods Devise provides that make our lives easier and what do they do?

## Section 2 - More Open Ended

1. In your own words, what is a merge conflict?

```
def post_params
  params.require(:post).permit(:title, :body)
end
```

2. What does the `post_params` method do? When does Rails require us to use so-called "Strong Params"?

```
class User
  validates :username, presence: true, uniqueness: true
end
```

3. Given the above validations, if a form for a user was submitted
   with no username filled in, what would happen?
   Provide as much detail as you're comfortable with.
