#!/bin/bash

python3 utils/question_entry.py quizzes
git add quizzes/*.txt
git commit quizzes/*.txt -m "Added questions."
