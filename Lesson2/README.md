# Lesson 2 HomeWork

## Exercise

1. Write a YAML file that deploys the following:
   - two applications that is routed via ingress controller
   - the application is about cheese store.
   - the application address is: https://ams.cheese.com
   - the application will have two deployments:
     - cheddar
     - gauda
   - setup an ingress controller that will route the following:
     - https://ams.cheese.com/cedder -> will go to the cheddar deployment
     - https://ams.cheese.com/gauda -> will go to the gauda deployment
2. Mount as config map the attached file to an nginx container under the path `/usr/share/nginx/html`

3. BONUS: write your images that will return images of those cheeses and use them in your YAML files.

## Answers:

- [See question 1 folder](https://github.com/khjomaa/DevOpsAdvanced/tree/master/Lesson2/question_1)
- [See question 2 folder](https://github.com/khjomaa/DevOpsAdvanced/tree/master/Lesson2/question_2)
- [See question 3 folder](https://github.com/khjomaa/DevOpsAdvanced/tree/master/Lesson2/question_3_bonus)
