require 'pry'

module Killable
  def alive?
    self.health > 0
  end

  def dead?
    not self.alive?
  end
end

## Warrior => Thief => Mage => Warrior
# def damage(other)
## if other.is_a? Thief
##    omg they dead ya'll
## elsif other.is_a? Mage
##    omg i better run
## else
##    this should be fair
## end

module Zombifiable
  # DEPENDS ON THE Killable MODULE!!!
  def reanimate
    if self.dead?
      self.health = Float::Infinity
    end
  end

  def headshot
    puts "Boom!"
    self.health = 0
  end
end

class Adventurer
  attr_reader :name
  attr_accessor :health, :level
  include Killable
  include Comparable

  def initialize(name, level=1)
    puts "Parameters are: #{name}, #{level}"
    puts "@health_per_level is currently #{@health_per_level}"
    @health_per_level ||= 10
    @damage_per_level ||= 2
    @level = level
    @name = name
    @health = level * @health_per_level
  end

  def <=>(other)
    level_compare = self.level <=> other.level
    if level_compare.zero?
      self.name.length <=> other.name.length
    else
      level_compare
    end
  end

  def max_damage
    @level * @damage_per_level
  end

  def damage
    rand(1..max_damage)
  end

  def attack(other)
    if other.respond_to?(:health=)
      damage = self.damage
      other.health -= damage
      if damage > 10
        descriptor = "wallops"
      elsif damage > 3
        descriptor = "hits"
      else
        descriptor = "trips towards"
      end
      puts "#{self} #{descriptor} #{other} for #{damage} points of damage."
    else
      puts "You can't attack #{other}!"
    end
  end

  def to_s
    @name
  end
end

class Monster
  attr_reader :level, :name
  attr_accessor :health

  include Killable

  def initialize(level)
    @level = level
    @name = "Monster (#{level})"
    @health = 0
    level.times { @health += rand(1..4) }
  end

  def attack(other)
    damage = rand(1..4) * @level
    puts "#{self} viciously assaults #{other} for #{damage} damage."
    other.health -= damage
  end

  def self.horde(n)
    (1..n).map { Monster.new(1) }
  end

  def to_s
    @name
  end
end

class Warrior < Adventurer
  def initialize(name, weapon, level=1)
    puts "Parameters are: #{name}, #{weapon}, #{level}"
    @weapon = weapon
    @damage_per_level = 4
    @health_per_level = 20
    @attack_count = 0
    super(name, level)
    puts "Calling Super with: #{name}, #{level}"
  end

  def attack(other)
    super
    @attack_count += 1
  end

  def self.count(n)
  end

  def call_backup(n)
    (1..n).map { |x| Warrior.new('test', 'axe', x) }
  end

  def savage_attack(other)
    puts "Beating #{other} senseless with a(n) #{@weapon}"
    num_attacks = (@level / 3) + 1
    num_attacks.times { self.attack(other) }
    other.attack(self) if @attack_count.even?
  end
end

class Wizard < Adventurer
  def initialize(name, spells, level=1)
  end

  def magic_missile
    puts "FIRE ZE MISSILES"
  end

  def fireball
    puts "THEY ARE HURTING NOW"
  end
end

class Priest < Adventurer
  def heal
    puts "I HEALED PEOPLE"
  end
end

class Thief < Adventurer
  def steal
    puts "I GOT FREE THINGS"
  end
end

class Villager < Adventurer
  def attack
    puts "why the hell are ya'll always fighting?!?"
  end
end

class Character
end

class Adventurer < Character
  def attack
  end
end

class Warrior < Adventurer
  def savage_attack # blah blah blah
  end
end

binding.pry
