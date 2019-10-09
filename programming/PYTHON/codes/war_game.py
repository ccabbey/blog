# PART II CHAPTER 15 
# 使用python实现纸牌游戏“战争”
# 在该游戏中，每名玩家从牌堆中抽取一张牌，牌面点数最高的玩家获胜。
# 类：玩家，牌堆，单牌，牌局
import random

class Card:
    suits=[
        "spades",
        "hearts",
        "diamonds",
        "clubs"
    ]
    values=[
        "None","None","2","3","4",
        "5","6","7","8","9","10",
        "Jack","Queen","King","Ace"
    ]
    def __init__(self,v,s):
        self.value=v
        self.suit=s
    def __lt__(self,c2):
        if self.value<c2.value:
            return True
        if self.value==c2.value:
            if self.suit<c2.suit:
                return True
            else:
                return False
        return False

    def __gt__(self,c2):
        if self.value>c2.value:
            return True
        if self.value==c2.value:
            if self.suit>c2.suit:
                return True
            else:
                return False
        return False
    def __repr__(self):
        s=self.values[self.value]+" of "\
            +self.suits[self.suit]
        return s

class Deck:
    def __init__(self):
        self.decks=[]
        for s in range(4):
            for v in range(2,15):
                self.decks.append(Card(v,s))
        random.shuffle(self.decks)
    def rm_card(self):
        if len(self.decks)>0:
            return self.decks.pop()
        else:
            return
class Player:
    def __init__(self,name):
        self.name=name
        self.card=None
        self.wins=0
class Game:
    def __init__(self):
        nm1=input("enter p1 name:")
        nm2=input("enter p2 name:")
        self.p1=Player(nm1)
        self.p2=Player(nm2)
        self.deck=Deck()
    
    def wins(self,winner):
        print("{} wins this round!".format(winner))
    
    def draw(self,p1name,p1card,p2name,p2card):
        print("{} drew {}, {} drew {}.".format(p1name,p1card,p2name,p2card))
    
    def winner(self,p1,p2):
        if p1.wins>p2.wins:
            return p1.name
        return p2.name

    def play(self):
        cards=self.deck.decks
        print("war has started!")
        while len(cards)>0:
            m="input 'q' to quit, input any key to continue..."
            response=input(m)
            if response=="q":
                break
            p1c=self.deck.rm_card()
            p2c=self.deck.rm_card()
            p1n=self.p1.name
            p2n=self.p2.name
            self.draw(p1n,p1c,p2n,p2c)
            if p1c>p2c:
                self.p1.wins+=1
                self.wins(p1n)
            else:
                self.p2.wins+=1
                self.wins(p2n)
        
        win_player=self.winner(self.p1,self.p2)
        print("{} has won the game!".format(win_player))

game=Game()
game.play()


        
        
