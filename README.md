# Script Collection
Automate my repetitive tasks

## Git CLI

**[Git Statistic](https://github.com/dedenbangkit/script-collection/blob/main/git-cli/git-stat.sh)**

```bash
./git-stat.sh
```
Dependency:
- Pick

## Miscellaneous

**[Bulk Downloader](https://github.com/dedenbangkit/script-collection/blob/main/misc/bulk-downloader.sh)**

```bash
./bulk-downloader.sh ./files.json
```
First array in the [files.json](https://github.com/dedenbangkit/script-collection/blob/main/misc/bulk-downloader/files.json) is the destination folder.

Dependency:
- wget


**[Table](https://github.com/dedenbangkit/script-collection/blob/main/misc/table.sh)**

```bash
./table.sh
```
Dependency:
- Pick
- [Visidata](https://www.visidata.org/)

Options:
- Chrome, Find any tables in the current Chrome Tabs
- MySQL, Pick available MySQL table then open with visidata
- PostgreSQL, Pick available PostgreSQL table then open with visidata
