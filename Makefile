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
APPEND_FILE = Statistics_report.md  # Adjust the path as needed



append_and_commit:
	# Append the content of the Markdown file to the README
	cat $(APPEND_FILE) >> README.md
	
	# Check if there are any changes
	@if [ -n "$$(git status --porcelain)" ]; then \
		git config --local user.email "action@github.com"; \
		git config --local user.name "GitHub Action"; \
		# Commit the changes
		git add README.md; \
		git commit -m "Append content to README"; \
		# Push the changes
		git push; \
	else \
		echo "No changes to commit. Skipping commit and push."; \
	fi
