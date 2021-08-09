# Github Action: ktlint with reviewdog

The main difference between this action and other similar ktlint Github Actions is focus on security. 
The action does not download anything blindly from the Internet.
All downloaded files are validated against checksum.

## Example
```yaml
name: reviewdog
on: [pull_request]
jobs:
  ktlint:
    name: Check Code Quality
    runs-on: ubuntu-latest

    steps:
      - name: Clone repo
        uses: actions/checkout@master
      - name: ktlint
        uses: Qminder/github-action-ktlint@master
        with:
          github_token: ${{ secrets.github_token }}
```
