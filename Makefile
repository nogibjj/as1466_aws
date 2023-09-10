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

add_commit_push:
	@if [ -n "$$(git status --porcelain)" ]; then \
		git config --local user.email "action@github.com"; \
		git config --local user.name "GitHub Action"; \
		git add pairplot.png boxplots.png Statistics_report.md; \
		git commit -m "Add generated plot image"; \
		git push; \
	else \
		echo "No changes to commit. Skipping commit and push."; \
	fi

# Makefile for updating the README with appended content

# Define the name of the Markdown file to append

update-readme:
    cat Statistics_report.md >> README.md
    git config --global user.name "GitHub Actions"
    git config --global user.email "actions@github.com"
    git add README.md
    git commit -m "Update README.md"
    git push
