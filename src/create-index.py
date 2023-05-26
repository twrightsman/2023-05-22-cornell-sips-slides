#!/usr/bin/env python3

import argparse
from pathlib import Path

TEMPLATE = '''\
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Slide Decks</title>
  </head>
  <body>
    <h2>Slide Decks</h2>
    <ul>
{listing}
    </ul>
  </body>
</html>'''


def main(directory: Path):
    listing = "\n".join((f"      <li><a href=\"{child.name}\">{child.name}</a></li>" for child in directory.iterdir() if child.is_file()))
    print(TEMPLATE.format(listing = listing))

if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    parser.add_argument(
        'directory',
        help = 'directory to create an HTML index for',
        type = Path
    )

    args = parser.parse_args()

    main(directory = args.directory)
