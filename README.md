# LoL Replay Library

Greetings, summoners! (too cheesy?)

This is a Ruby library for accessing the end game metadata in .lrf files (LoL
Replay files). It's pretty small and simple at the moment and just makes life a
bit easier if you want to run some stats analysis on your LoL Replay files.

# Installation

Provided you have Ruby with RubyGems installed, installation is the standard gem
one liner:

    $ gem install lolreplay

# Usage

The program under the bin directory should give you a little idea as to how this
library works. Here's another short example:

```
  game = LolReplay::Game.new "path/to/lrffile.lrf"

  samwho = game.player "Samwho"

  samwho.kills
  #=> the number of kills I had

  samwho.largest_crit
  #=> the largest crit I did

  samwho.gold
  #=> the amount of gold I earned

  samwho.killing_spree
  #=> the largest killing spree I had
```

LoL Replay files contain JSON metadata in them, all this library
does is read that metadata and expose it through some classes. I took a bit of a
shortcut when exposing the JSON data and made the method names the hash keys. So
there isn't a single method for each bit of data, the method names are
dynamically translated from underscored_names to camelCase and then fed to the
hash as a key.

The upside is that the library should stand the test of time. Provided the guys
at LoL Replay don't change where the JSON data is located in the file, this
library should be able to get at any new metadata added to the files.

The downside is that RDocs won't represent the library very well. So I'll
explain how to know where to find the data you want.

# What data can I access?

Here's some JSON output of a recent game I had:

```
{
  "accountID": 12345678,
    "clientHash": "6f7t2dcaga7hfg64g9433408s8defy6y",
    "clientVersion": "1.0.0.130",
    "dataIndex": [
    {
      "Key": "stream",
      "Value": {
        "offset": 0,
        "size": 4367077
      }
    },
    {
      "Key": "s0",
      "Value": {
        "offset": 4367077,
        "size": 84609
      }
    },
    {
      "Key": "s1",
      "Value": {
        "offset": 4451686,
        "size": 109687
      }
    },
    {
      "Key": "s2",
      "Value": {
        "offset": 4561373,
        "size": 112188
      }
    },
    {
      "Key": "s3",
      "Value": {
        "offset": 4673561,
        "size": 132680
      }
    },
    {
      "Key": "s4",
      "Value": {
        "offset": 4806241,
        "size": 93201
      }
    },
    {
      "Key": "s5",
      "Value": {
        "offset": 4899442,
        "size": 107907
      }
    },
    {
      "Key": "s6",
      "Value": {
        "offset": 5007349,
        "size": 113622
      }
    }
  ],
    "encryptionKey": "tPsrrs4l8e0qqe3ly6ouut4p",
    "firstWinBonus": 0,
    "gameMode": 1,
    "map": 2,
    "matchID": 263521613,
    "matchLength": 1849,
    "matchType": 3,
    "name": "YouSummonerName - ChampionName",
    "players": [
    {
      "accountID": 23608408,
      "assists": 8,
      "barracks": 0,
      "champion": "XinZhao",
      "damageDealt": 49554,
      "damageTaken": 22591,
      "deaths": 7,
      "elo": 0,
      "eloChange": 0,
      "gold": 5860,
      "healed": 3375,
      "item1": 1055,
      "item2": 3006,
      "item3": 3072,
      "item4": 3086,
      "killingSpree": 2,
      "kills": 2,
      "largestCrit": 389,
      "largestMultiKill": 1,
      "leaver": false,
      "leaves": 8,
      "level": 13,
      "losses": 143,
      "magicDamageDealt": 965,
      "magicDamageTaken": 8270,
      "minions": 69,
      "neutralMinionsKilled": 6,
      "physicalDamageDealt": 48589,
      "physicalDamageTaken": 13535,
      "profileIconId": 23,
      "spell1": 3,
      "spell2": 4,
      "summoner": "ASummonerName",
      "summonerLevel": 30,
      "team": 2,
      "timeDead": 195,
      "turrets": 0,
      "wins": 153,
      "won": false
    }],
    "queueType": "NORMAL",
    "ranked": false,
    "region": "EUW",
    "replayID": -1,
    "replayVersion": "0.7.4.12",
    "screenshots": [
    {
      "name": "s0",
      "timestamp": 30052,
      "type": ".jpg"
    },
    {
      "name": "s1",
      "timestamp": 329992,
      "type": ".jpg"
    },
    {
      "name": "s2",
      "timestamp": 630036,
      "type": ".jpg"
    },
    {
      "name": "s3",
      "timestamp": 930077,
      "type": ".jpg"
    },
    {
      "name": "s4",
      "timestamp": 1230186,
      "type": ".jpg"
    },
    {
      "name": "s5",
      "timestamp": 1530203,
      "type": ".jpg"
    },
    {
      "name": "s6",
      "timestamp": 1830247,
      "type": ".jpg"
    }
  ],
    "serverAddress": "31.186.224.155",
    "serverPort": 5158,
    "spectatorMode": false,
    "summonerName": "YourSummerName",
    "teams": null,
    "timestamp": 1323233142,
    "winningTeam": 1
}
```

I've scrubbed any sensitive data and the names and timestamps have all been
changed, just in case I get in trouble.

Basically, you can access all of this. The LolReplay::Game object you create
will have this JSON inside it and whenever a method comes in, it will convert
the method name from an underscore_name to a camelCase name and use it as a key
to this hash.

To access the players, use the `players` method. Then you can access all of the
stuff you see for the example player up there. That's all there is to it :)
