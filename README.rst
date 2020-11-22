notes - CLI notes management application
========================================

`notes` is a command line note management application written in ``bash``.
`notes` allows users to to create/edit/(re-)move their notes and was designed
with an emphasis on easy search and navigation through the existing notes.

`notes` stores user notes in a directory tree under, with each note being a
simple plaintext file with a user defined formatting (if any).

Installation
------------

You can install `notes` with:

::

    make install

Use ``PREFIX`` variable to control installation destination.

Usage
-----

In order to create a new note you can run

::

    $ notes add temp/first_note

This command will open an editor (as specified by the ``${EDITOR}`` environment
var) where you can enter contents of your note. Once you are done, the note
will be stored in a file ``~/.notes/temp/first_note``.

You can list saved notes with:

::

    $ notes list
    notes
    └── temp
        ├── first_note       [ 1 ]
        └── second_note      [ 2 ]

The list command outputs a tree view of existing notes. At the end of each
entry there is a note index (like ``[ 1 ]``). You can use this index as a quick
reference to a given note. The index is regenerated each time ``list``,
``find`` or ``grep`` command is called.

You can search existing notes by name with a ``find`` command:

::

    $ notes find second
    [ 1 ] : temp/second_note
    Body of the second note

or search a note by its content with a ``grep`` command:

::

    $ notes grep second

    [ 1 ] : temp/second_note
    Body of the second note

The notes can be viewed with ``cat`` or ``less`` commands and can be referred
either by index, like

::

    $ notes cat 1
    >>> temp/second_note
    Body of the second note

or by note path

::

    $ notes cat temp/first_note
    >>> temp/first_note
    Body of the first note

You can find more information about `notes` usage in its manual page

::

    $ man notes

