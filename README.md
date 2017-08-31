![](http://assets.jisho.org/assets/jisho-logo-v4@2x-7330091c079b9dd59601401b052b52e103978221c8fb6f5e22406d871fcc746a.png)
# JishoElixir [![Hex pm](http://img.shields.io/hexpm/v/jisho_elixir.svg?style=flat)](https://hex.pm/packages/httpoison)

A wrapper around Jisho.org's API (http://jisho.org).

### What is [Jisho.org](http://jisho.org/)?
It's an online Japanese to English dictionary that you can read about [here](http://jisho.org/about).

### JishoElixir currently Supports

1. Searching by word
2. Searching by tags [http://jisho.org/docs](http://jisho.org/docs)
3. Searching for verbs 
4. And much more if you combine them.  

## Installation

First, add JishoElixir to your mix.exs dependencies:
```elixir
def deps do
  [
    {:jisho_elixir, "~> 0.1.0"}
  ]
end
```

and run $ mix deps.get

## Usage

Your best bet is to visit the hex docs, but:

```elixir
	JishoElixir.search("峠", ["n", "exp"], 1)
```
```elixir
	JishoElixir.tag("jlpt-n1")
```
```elixir
	JishoElixir.verb("prance")

```

## FAQ
### What about formatting the response?

The library returns a map that's been parsed directly from json. I leave it up to you to write a wrapper around it. 

### Do I need an API key?

Nope.

### Where can I find documentation for the Jisho API

At the moment, just [here](http://jisho.org/forum/54fefc1f6e73340b1f160000-is-there-any-kind-of-search-api).

### What about kanji?

It's been hinted by the Jisho team that it's on the way, but for now you can search kanji the same way you search a word. The downside is kanji _tags_ (found [here](http://jisho.org/docs)) won't work. 

## Thanks

Thank you to the [Jisho.org](http://jisho.org/) team, especially [Kimtaro](https://github.com/Kimtaro). 
