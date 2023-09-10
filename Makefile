install:
	pip install --upgrade pip &&\
		pip install --prefer-binary -r requirements.txt

test:
	python -m pytest -vv  test_*.py

format:
	black *.py

lint:
	pylint --disable=R,C --ignore-patterns=test_.*?py *.py

all: install lint format test

add_boxplot:
    git config --local user.email "action@github.com"
    git config --local user.name "GitHub Action"
    git add boxplots.png  # Adjust the filename if needed
    git commit -m "Add generated plot image"
    git push
