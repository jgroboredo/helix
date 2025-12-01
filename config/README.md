# Notes about helix

## Global search and replace

One way to do this is to create a macro:

- First, do the global search so that the buffer picker opens with the search
  already filtering everything: `<space>/searchterm<ret><esc>`;
- Second, make the macro:

  - `<space>'<tab><ret>ssearchterm<ret>creplaceterm<esc>`

  where:

  - `<space>'<tab><ret>` will open the last buffer picker (the one we got previously)
    and will select the next buffer in the pipeline to be changed;
  - Then press `s` (since the entire line will be highlighted after the search) and
    the searchterm again;
  - Then, replace it the best way;

- In the end, save everything with `:wa`.
