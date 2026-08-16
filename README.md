
```
Mm kay overall, it's starting to look pretty good. I got a decent start going that I need to refine into a proper structure but that can still be put off. Not for too long otherwise it'll be a pain to migrate things over. I'll figure out a proper structure before starting a Hyprland config. For now, I'll work on importing in the more important tools like obsidian, yt-dlp, nvim, etc.
```

# To Do
## Hot Swappable parts
The vision is for a way to be able to work on different parts of the machine at without affecting the other. Like having seperate parts for the Desktop Environment, custom shell tools, custom program configs, etc that have different branches for managing different changes. 

Such as having a stable stack that looks like:
- Plasma
- Tool for auto commiting changes
- Base config for bash

then having branches for each that look like:
- WIP migration to hyprland
- Changes to the tool to allow one line package imports
- WIP config for artsy fartsy bash

In order for this to be possible, I need a way to manage these different versions. The most obvious answer is git controlling. 

```
Okay the idea in my head is getting too convoluted. Gonna spend some time researching different ways people have version controlled their set up that allows "hot swapping" features/branches. I think I'm onto something but it involves having multiple repos for different features, branches for different versions of the features, having a script to change the flake, swap the git branch, etc etc and it's becoming a headache.
```

# Tools
- Lazygit
- Lazydocker (to download)
- Vim (replace with nvim)
- Bash (needs a fancy make over. I want colored ls info)
- yt-dlp
- Bettercap (to download)
- Obsidian (to download + import diaries)
- Zen (to download)
- ...
