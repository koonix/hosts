# hosts

ad and porn websites that I come across,
that and are not blocked by other hosts files.

the file `google-safesearch` forces google's safesearch on.

other anti-porn hosts files:

[StevenBlack](https://github.com/StevenBlack/hosts/tree/master/alternates/porn)

[4skinSkywalker](https://github.com/4skinSkywalker/Anti-Porn-HOSTS-File)

## add.sh

if you want to contribute, you can use `add.sh` to
add your websites in:

```sh
./add.sh abc.com xyz.com ...
git push
```

or put all of your websites in a text file, one per line,
then:

```sh
./add.sh list-of-websites.txt
git push
```

it automatically sorts the list and adds www variants
as well.
