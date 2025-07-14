--- STEAMODDED HEADER
--- MOD_NAME: peakshitmod
--- MOD_ID: PeakShitMod
--- MOD_AUTHOR: [peakshitposts]
--- MOD_DESCRIPTION: adds whatever i want fuck you
--- VERSION: 1.0.0
--- PREFIX: PSM
----------------------------------------------
------------MOD CODE -------------------------


-- Load images
SMODS.Atlas {
    key = "skibiditoiletrizz",
    path = "skibiditoiletrizz.png",
    px = 213,
    py = 375
}

SMODS.Atlas {
    key = "kingofpranks",
    path = "kingofpranks.png",
    px = 875,
    py = 1140
}

SMODS.Atlas {
    key = "diamondpickaxe",
    path = "diamondpickaxe.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "shoheiohtani",
    path = "ohtani.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "racist",
    path = "racist.png",
    px = 621,
    py = 873
}

SMODS.Atlas {
    key = "ye",
    path = "ye.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "yeezus",
    path = "yeezus.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "kanye",
    path = "kanye.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "coca_cola",
    path = "coke.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "bendy",
    path = "bendy.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "inkmachine",
    path = "inkmachine.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "ink",
    path = "ink.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "aliceangel",
    path = "aliceangel.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "wallyfranks",
    path = "wallyfranks.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "dg",
    path = "dg.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "tomnook",
    path = "tn.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "heisenburg",
    path = "heisenburg.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "meth",
    path = "meth.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "jp",
    path = "jp.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "sw",
    path = "sw.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "gus",
    path = "gus.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "saul",
    path = "saul.png",
    px = 232,
    py = 329
}

SMODS.Atlas {
    key = "ts",
    path = "ts.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "twix",
    path = "twix.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "homelander",
    path = "homelander.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "atrain",
    path = "atrain.png",
    px = 296,
    py = 415
}

SMODS.Atlas {
    key = "td",
    path = "td.png",
    px = 257,
    py = 360
}

SMODS.Atlas {
    key = "cb",
    path = "cb.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "sc",
    path = "sc.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "wh",
    path = "wh.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "hulk",
    path = "hulk.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "bb",
    path = "bb.png",
    px = 500,
    py = 700
}

SMODS.Atlas {
    key = "cv",
    path = "cv.png",
    px = 500,
    py = 700
}

-- Register both sounds globally
SMODS.Sound {
    key = "PSM_forever",
    path = "forever.ogg"
}
SMODS.Sound {
    key = "PSM_ioh",
    path = "IOH.ogg"
}
SMODS.Sound {
    key = "PSM_tt",
    path = "tt.ogg"
}
SMODS.Sound:register_global()

-- Functions to play sounds
local function play_IOH()
    play_sound("PSM_ioh", 1.0, 1.0)
end

local function play_tt()
    play_sound("PSM_tt", 1.0, 1.7)
end


local function play_kingofpranks()
    play_sound("PSM_forever", 1.0, 1.0)
end


-- Joker: Skibidi Toilet Rizz
SMODS.Joker {
    key = "skibiditoiletrizz",
    loc_txt = {
        name = "Skibidi Toilet Rizz",
        text = {
            "Each scored {C:attention}Heart{} gives:",
            "{C:mult}+#2#{} Mult, {C:chips}+#1#{} Chips, and {C:money}$#3#{}"
        }
    },
    config = {
        extra = {
            chips = 10, -- Chips granted per Heart
            mult = 3,   -- Multiplier granted per Heart
            money = 1   -- Money granted per Heart
        }
    },
    rarity = 1,
    cost = 5,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = "skibiditoiletrizz",
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, card)
        local chips = card.ability.extra and card.ability.extra.chips or 10
        local mult = card.ability.extra and card.ability.extra.mult or 3
        local money = card.ability.extra and card.ability.extra.money or 1
        return { vars = { tostring(chips), tostring(mult), tostring(money) } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.base.suit == "Hearts" and not context.other_card.debuff then
                return {
                    chips = card.ability.extra.chips or 10,
                    mult = card.ability.extra.mult or 3,
                    dollars = card.ability.extra.money or 1,
                    colour = G.C.HEART
                }
            end
        end
    end
}

-- Joker: King of Pranks
SMODS.Joker {
    key = "kingofpranks",
    loc_txt = {
        name = "King of Pranks",
        text = {
            "Grants {X:mult,C:white}X#1#{} Mult",
            "{C:inactive}(#2# in 4 chance to get {C:red}PRANKED!{}{C:inactive}){}",
            "and receive {X:mult,C:white}X#3#{} Mult instead"
        }
    },
    config = {
        extra = {
            prank = false,
            mult_normal = 3,
            prank_chance = 1,
            mult_pranked = 0.01
        }
    },
    rarity = 2,
    cost = 6,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = "kingofpranks",
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, card)
        local mult_display = card.ability.extra.prank and tostring(card.ability.extra.mult_pranked) or tostring(card.ability.extra.mult_normal)
        return {
            vars = {
                tostring(card.ability.extra.mult_normal),
                tostring(card.ability.extra.prank_chance),
                tostring(card.ability.extra.mult_pranked)
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers and not context.blueprint then
            card.ability.extra.prank = pseudorandom("prankster") < (card.ability.extra.prank_chance / 4)
        elseif context.joker_main then
            if card.ability.extra.prank then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_kingofpranks()
                        return true
                    end,
                    delay = 0.01
                }))
                return {
                    x_mult = card.ability.extra.mult_pranked,
                    message = "PRANKED!",
                    colour = G.C.RED
                }
            else
                return {
                    x_mult = card.ability.extra.mult_normal
                }
            end
        end
    end
}

SMODS.Joker {
    key = "diamondpickaxe",
    rarity = 3,
    cost = 8,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = "diamondpickaxe",
    pos = { x = 0, y = 0 },

    loc_txt = {
        ['en-us'] = {
            name = "Diamond Pickaxe",
            text = {
                "{C:inactive}Each scored card mines chips:",
                "{C:black}Coal (+#1#)",
                "{C:orange}Copper (+#2#)",
                "{C:blue}Iron (+#3#)",
                "{C:blue}Diamond (+#4#)",
                "{C:inactive}(currently: {C:attention}+#5#{C:inactive})"
            }
        }
    },

    config = {
        extra = {
            mined_total = 0,
            coal = 1,
            copper = 5,
            iron = 10,
            diamond = 25
        }
    },

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra or {}
        return {
            vars = {
                tostring(e.coal or 1),
                tostring(e.copper or 5),
                tostring(e.iron or 10),
                tostring(e.diamond or 25),
                tostring(e.mined_total or 0)
            }
        }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra or {}
        if context.individual and context.cardarea == G.play then
            local roll = pseudorandom('mine_' .. tostring(context.other_card.uuid))
            local amount, label

            if roll < 0.50 then
                amount, label = e.coal or 1, "Coal"
            elseif roll < 0.75 then
                amount, label = e.copper or 5, "Copper"
            elseif roll < 0.95 then
                amount, label = e.iron or 10, "Iron"
            else
                amount, label = e.diamond or 25, "Diamond"
            end

            card.ability.extra.mined_total = (e.mined_total or 0) + amount

            if G.hovered_card == card then
                G.card_tooltip:remove()
                G.card_tooltip = nil
                G.GAME.last_hovered_card = nil
            end

            return {
                message = label .. " (+" .. amount .. ")",
                colour = G.C.BLUE,
                card = card
            }

        elseif context.joker_main then
            local total = e.mined_total or 0
            if total > 0 then
                return {
                    chips = total,
                    colour = G.C.BLUE,
                    card = self
                }
            end
        end
    end
}

SMODS.Joker {
    key = "shoheiohtani",
    loc_txt = {
        name = "Shohei Ohtani",
        text = {
            "Alternates each hand between",
            "{C:chips}+#1#{} Chips or {C:mult}+#2#{} Mult"
        }
    },
    config = {
        extra = {
            give_mult = false,
            chips = 75,
            mult = 10
        }
    },
    rarity = 2,
    cost = 7,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = "shoheiohtani",
    pos = { x = 0, y = 0 },

    loc_vars = function(self, info_queue, card)
        local chips = (card.ability.extra.chips) or 75
        local mult = (card.ability.extra.mult) or 10
        return { vars = { tostring(chips), tostring(mult) } }
    end,

    calculate = function(self, card, context)
        local chips = card.ability.extra.chips or self.config.extra.chips
        local mult = card.ability.extra.mult or self.config.extra.mult

        -- Flip value at the start of each hand (before scoring)
        if context.before and context.cardarea == G.jokers and not context.blueprint then
            card.ability.extra.give_mult = not card.ability.extra.give_mult
        end

        -- Apply effect during scoring
        if context.joker_main then
            if card.ability.extra.give_mult then
                return {
                    mult = mult,
                    message = "Two-Way",
                    colour = G.C.MULT
                }
            else
                return {
                    chips = chips,
                    message = "Two-Way",
                    colour = G.C.CHIPS
                }
            end
        end
    end
}

SMODS.Joker {
    key = "racist",
    loc_txt = {
        name = "Racist",
        text = {
            "Grants {C:mult}+#1#{} Mult",
            "ONLY if you have no",
            "{C:attention}Common{} Jokers equipped"
        }
    },
    config = {
        extra = {
            mult = 30
        }
    },
    rarity = 2, -- Uncommon
    cost = 5,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = "racist",
    pos = { x = 0, y = 0 },
    pools = { Standard = true, Uncommon = true },

    loc_vars = function(self, info_queue, card)
        local mult = (card.ability and card.ability.extra and card.ability.extra.mult) or (self.config and self.config.extra and self.config.extra.mult) or 30
        return { vars = { tostring(mult) } }
    end,

    calculate = function(self, card, context)
        if not context.joker_main then return end

        local has_common = false
        for i, j in ipairs(G.jokers.cards) do
            if j ~= card then
                local rarity = (j.config and j.config.center and j.config.center.rarity) or -1
                if rarity == 1 then
                    has_common = true
                    break
                end
            end
        end

        local mult = (card.ability.extra and card.ability.extra.mult) or (self.config.extra.mult)
        if not has_common then
            return { mult = mult, message = "pure...", colour = G.C.MULT }
        else
            return { message = "GRRRRRRR", colour = G.C.RED }
        end
    end
}

SMODS.Joker {
    key = "ye",
    atlas = "ye",
    rarity = 1,
    cost = 3,
    discovered = true,
    pos = {x = 0, y = 0},
    config = {
        extra = {
            chips = 20,
            mult = 5,
            xmult = 1.5,
            mode = "chips"
        }
    },
    loc_txt = {
        name = "Ye",
        text = {
            string.format("Each round randomly grants:"),
            string.format("{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult,"), 
            string.format("or {X:mult,C:white}X#3#{} Mult")
        }
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Kanye", G.C.RED, G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local chips = card.ability.extra.chips or self.config.extra.chips
        local mult = card.ability.extra.mult or self.config.extra.mult
        local xmult = card.ability.extra.xmult or self.config.extra.xmult
        return { vars = { tostring(chips), tostring(mult), tostring(xmult) } }
    end,

    calculate = function(self, card, context)
        local chips = card.ability.extra.chips or self.config.extra.chips
        local mult = card.ability.extra.mult or self.config.extra.mult
        local xmult = card.ability.extra.xmult or self.config.extra.xmult

        if context.setting_blind then
            local modes = {"chips", "mult", "xmult"}
            card.ability.extra.mode = pseudorandom_element(modes, pseudoseed("ye_shift"))
        elseif context.joker_main then
            if card.ability.extra.mode == "chips" then
                return { chips = chips, colour = G.C.CHIPS }
            elseif card.ability.extra.mode == "mult" then
                return { mult = mult, colour = G.C.MULT }
            elseif card.ability.extra.mode == "xmult" then
                return { x_mult = xmult, colour = G.C.MULT }
            end
        end
    end
}

SMODS.Joker {
    key = "yeezus",
    atlas = "yeezus",
    rarity = 2,
    cost = 6,
    discovered = true,
    pos = {x = 0, y = 0},
    config = { extra = { 
        triggered_this_hand = false ,
        chance = 1, -- 1 in 5 chance
    } },
    loc_txt = {
        name = "Yeezus",
        text = {
            "At end of each hand, {C:attention}#2# in 5{} chance",
            "to give a random {C:attention}Edition{} to",
            "a {C:attention}Joker{} or {C:attention}played card{}"
        }
    },
    
    loc_vars = function(self, info_queue, card)
        local chance = (card.ability and card.ability.extra and card.ability.extra.chance) or (self.config and self.config.extra and self.config.extra.chance) or 5
        return { vars = { "", tostring(chance) } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Kanye", G.C.RED, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        -- Reset once per hand
        if context.before and context.main_eval then
            card.ability.extra.triggered_this_hand = false
        end

        if context.after and context.cardarea == G.jokers and not context.blueprint and not card.ability.extra.triggered_this_hand then
            card.ability.extra.triggered_this_hand = true

            local chance = (card.ability and card.ability.extra and card.ability.extra.chance) or (self.config and self.config.extra and self.config.extra.chance) or 1
            local rolled = pseudorandom('yeezus_trigger')
            if rolled < chance/5 then
                local targets = {}

                -- Only use cards from the actual played hand
                for _, c in ipairs(context.full_hand or {}) do
                    if not c.edition and c.set_edition then
                        table.insert(targets, c)
                    end
                end

                -- Also include other jokers
                for _, j in ipairs(G.jokers.cards) do
                    if j ~= card and not j.edition and j.set_edition then
                        table.insert(targets, j)
                    end
                end

                if #targets > 0 then
                    local chosen = pseudorandom_element(targets, pseudoseed("yeezus_target"))
                    local enhancement = pseudorandom_element({"e_foil", "e_holo", "e_polychrome", "e_negative"}, pseudoseed("yeezus_type"))

                    chosen:set_edition(enhancement, true)
                    if chosen.set_cost then chosen:set_cost() end

                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "Blessed",
                        colour = G.C.DARK_EDITION
                    })
                else
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "No Targets",
                        colour = G.C.RED
                    })
                end
            else
            end
        end
    end
}

SMODS.Joker {
  key = "kanye",
  name = "Kanye West",
  atlas = "kanye",
  rarity = 3,
  cost = 9,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  pos = {x = 0, y = 0},
  config = { extra = { mult = 10 } },
  loc_txt = {
    name = "Kanye West",
    text = {
      "Copies the effects of adjacent Jokers",
      "and adds {C:mult}+#1#{} Mult"
    }
  },

    loc_vars = function(self, info_queue, card)
        local mult = card.ability.extra.mult or self.config.extra.mult or 10
        return { vars = { tostring(mult) } }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Kanye", G.C.RED, G.C.WHITE, 1)
    end,

  calculate = function(self, card, context)
    local valid_phase = context.joker_main or context.individual
    if not valid_phase then return end

    local bonus = {}
    if context.joker_main then
      bonus = { mult = card.ability.extra.mult, message = "I Am Them", colour = G.C.MULT }
    end

    -- Find Kanye's index in G.jokers.cards
    local index = nil
    for i, j in ipairs(G.jokers.cards) do
      if j == card then
        index = i
        break
      end
    end
    if not index then return bonus end

    -- Get adjacent jokers
    local neighbors = {}
    if G.jokers.cards[index - 1] then table.insert(neighbors, G.jokers.cards[index - 1]) end
    if G.jokers.cards[index + 1] then table.insert(neighbors, G.jokers.cards[index + 1]) end

    for _, neighbor in ipairs(neighbors) do
      if neighbor ~= card then
        local result = SMODS.blueprint_effect(card, neighbor, context)
        if result and type(result) == "table" then
          for k, v in pairs(result) do
            if k ~= "message" and type(v) == "number" then
              bonus[k] = (bonus[k] or 0) + v
            end
          end
        end
      end
    end

    return next(bonus) and bonus or nil
  end
}

SMODS.Joker {
    key = "coca_cola",
    name = "Coca-Cola",
    atlas = "coca_cola",
    rarity = 4,
    cost = 25,
    discovered = true,
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    pos = {x = 0, y = 0},

    loc_txt = {
        name = "Coca-Cola",
        text = {
            "{C:attention}When sold{}, gives every",
            "{C:attention}playing card{} in your deck",
            "a random {C:attention}Edition{} and {C:attention}Enhancement{}"
        }
    },

    calculate = function(self, card, context)
        if context.selling_self and not context.blueprint then
            print("[COCA-COLA] Selling — modifying deck cards")

            local all_areas = { G.hand, G.deck, G.discard }

            for _, area in ipairs(all_areas) do
                for i, c in ipairs(area.cards or {}) do
                    if c and c.set_edition and c.set_ability then
                        local seed_key = c.ability and c.ability.uid or tostring(i)

                        -- Assign a random Edition
                        local edition = pseudorandom_element(
                            {"e_foil", "e_holo", "e_polychrome", "e_negative"},
                            pseudoseed("cola_edition_" .. seed_key)
                        )
                        c:set_edition(edition, true)

                        -- Assign a random Enhancement using poll_enhancement
                        local enhancement_key = {key = "cola", guaranteed = true}
                        local enhancement_center_id = SMODS.poll_enhancement(enhancement_key)
                        local enhancement_center = G.P_CENTERS[enhancement_center_id]

                        if enhancement_center then
                            c:set_ability(enhancement_center, nil, true)
                        end

                        if c.set_cost then c:set_cost() end
                    end
                end
            end

            card_eval_status_text(card, 'extra', nil, nil, nil, {
                colour = G.C.FILTER
            })

            play_sound('timpani', 1.3)

            return {
                message = "Refreshed!",
                colour = G.C.FILTER
            }
        end
    end
}

-- BENDY Joker
SMODS.Joker{
    key = "bendy",
    name = "Ink Demon",
    atlas = "bendy",
    rarity = 3,
    cost = 7,
    discovered = true,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = { x = 0, y = 0 },

    loc_txt = {
        ['en-us'] = {
            name = "Ink Demon",
            text = {
                "When a {C:attention}face card{} is scored,",
                "{C:attention}destroy{} it and add",
                "{C:blue}+20{} Chips and {X:mult,C:white}X#3#{} Mult",
                "{C:inactive}(currently: {C:blue}+#1#{} {C:inactive}Chips and {X:mult,C:white}X#2#{} {C:inactive}Mult){}"
            }
        }
    },

    config = {
        extra = {
            Chips = 0,
            XMult = 1.0,
            multgrowth = 0.4
        }
    },

    loc_vars = function(self, info_queue, card)
        local chips = card.ability.extra and card.ability.extra.Chips or 0
        local xmult = card.ability.extra and card.ability.extra.XMult or 1
        local multgrowth = card.ability.extra and card.ability.extra.multgrowth or 0.4
        return {
            vars = {
                tostring(chips),
                tostring(xmult),
                tostring(multgrowth)
            }
        }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Bendy", G.C.BLACK, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy and not context.blueprint then
            return { remove = true }
        end

        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:is_face() then
                context.other_card.should_destroy = true
                card.ability.extra.Chips = (card.ability.extra.Chips or 0) + card.ability.extra.Chips or 20
                card.ability.extra.XMult = (card.ability.extra.XMult or 1) + (card.ability.extra.multgrowth or 0.4)
                return {
                    message = "HARVESTED",
                    colour = G.C.RED
                }
            end
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.Chips or 0,
                x_mult = card.ability.extra.XMult or 1.0
            }
        end
    end
}

-- INK MACHINE Joker
SMODS.Joker{
    name = "Ink Machine",
    key = "inkmachine",
    config = {
        extra = {
            inks = 0
        }
    },
    loc_txt = {
        ['name'] = 'Ink Machine',
        ['text'] = {
            [1] = 'At end of round, adds a negative {C:attention}Ink{} joker.',
            [2] = 'Once 3 are present, they are combined to',
            [3] = 'create a random {C:attention}Bendy{} joker.',
            [4] = '{C:inactive}(if there is room){}'
        }
    },
    pos = {x = 0, y = 0},
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'inkmachine',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Bendy", G.C.BLACK, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.game_over and context.main_eval and not context.blueprint then
            return {
                func = function()
                    local bendy_pool = {
                        "j_PSM_bendy",      
                        "j_PSM_aliceangel", 
                        "j_PSM_wallyfranks", 
                        "j_PSM_dg", 
                    }

                    -- Count active Ink jokers
                    local ink_cards = {}
                    for _, joker in ipairs(G.jokers.cards) do
                        if joker.config.center.key == "j_PSM_ink" and not joker.getting_sliced then
                            table.insert(ink_cards, joker)
                        end
                    end

                    if #ink_cards < 3 then
                        -- Add another Ink
                        local ink = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_PSM_ink')
                        ink:set_edition("e_negative", true)
                        ink:add_to_deck()
                        G.jokers:emplace(ink)
                        card.ability.extra.inks = card.ability.extra.inks + 1
                        card_eval_status_text(card, 'extra', nil, nil, nil, {
                            colour = G.C.BLUE
                        })
                    elseif #ink_cards == 3 then
                        -- Check space
                        if #G.jokers.cards + G.GAME.joker_buffer >= G.jokers.config.card_limit then
                            card_eval_status_text(card, 'extra', nil, nil, nil, {
                                message = "No room!",
                                colour = G.C.RED
                            })
                            return true
                        end

                        -- Dissolve the inks
                        for _, ink in ipairs(ink_cards) do
                            ink.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    ink:start_dissolve({G.C.BLACK}, nil, 1.5)
                                    return true
                                end
                            }))
                        end

                        -- Spawn random Bendy-themed Joker
                        G.E_MANAGER:add_event(Event({
                            delay = 1.6,
                            func = function()
                                local chosen = pseudorandom_element(bendy_pool)
                                local joker = create_card('Joker', G.jokers, nil, nil, nil, nil, chosen)
                                joker:add_to_deck()
                                G.jokers:emplace(joker)
                                card.ability.extra.inks = 0
                                card_eval_status_text(card, 'extra', nil, nil, nil, {
                                    message = "Ink Given Form",
                                    colour = G.C.BLUE
                                })
                                return true
                            end
                        }))
                    end

                    return true
                end
            }
        end
    end
}


-- INK Joker
SMODS.Joker{
    name = "Ink",
    key = "ink",
    config = {
        extra = {}
    },
    loc_txt = {
        ['name'] = 'Ink',
        ['text'] = {
            [1] = 'The basis for creation using',
            [2] = 'the {C:attention}Ink Machine{}.'
        }
    },
    pos = {x = 0, y = 0},
    cost = 0,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'ink',

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    set_ability = function(self, card)
        card:set_eternal(true)
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Bendy", G.C.BLACK, G.C.WHITE, 1)
    end
}

SMODS.Joker{
    key = "aliceangel",
    name = "Alice Angel",
    atlas = "aliceangel",
    rarity = 2,
    cost = 4,
    discovered = true,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = { x = 0, y = 0 },

    config = {
        extra = {
            hands = 1,     -- You lose 1 hand
            discards = 3   -- You gain 3 discards
        }
    },

    loc_txt = {
        ['en-us'] = {
            name = "Alice Angel",
            text = {
                "When {C:attention}blind{} is selected,",
                "lose {C:blue}#1#{} hand and gain {C:red}#2#{} discards."
            }
        }
    },

    loc_vars = function(self, info_queue, card)
        local hands = (card.ability and card.ability.extra and card.ability.extra.hands) or (self.config and self.config.extra and self.config.extra.hands) or 1
        local discards = (card.ability and card.ability.extra and card.ability.extra.discards) or (self.config and self.config.extra and self.config.extra.discards) or 3
        return {
            vars = {
                tostring(hands),
                tostring(discards)
            }
        }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Bendy", G.C.BLACK, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            return {
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.hands).." Hand", colour = G.C.RED})
                    G.GAME.current_round.hands_left = math.max(0, G.GAME.current_round.hands_left - card.ability.extra.hands)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.discards).." Discard", colour = G.C.ORANGE})
                    G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + card.ability.extra.discards
                    return true
                end
            }
        end
    end
}

SMODS.Joker {
    name = "Wally Franks",
    key = "wallyfranks",
    config = {
        extra = {
            roundsremaining = 5,
            mult = 8,
            chips = 30
        }
    },
    loc_txt = {
        name = "Wally Franks",
        text = {
            "Gives {C:blue}+#3#{} Chips and {C:red}+#2#{} Mult",
            "Destroys after 5 rounds.",
            "{C:inactive}(remaining: {C:attention}#1#{}{C:inactive}){}"
        }
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Bendy", G.C.BLACK, G.C.WHITE, 1)
    end,
    loc_vars = function(self, info_queue, card)
        local roundsremaining = card.ability.extra and card.ability.extra.roundsremaining or 5
        local label = (roundsremaining == 1) and "round" or "rounds"
        local mult = card.ability.extra and card.ability.extra.mult or self.config.extra.mult
        local chips = card.ability.extra and card.ability.extra.chips or self.config.extra.chips
        return {
            vars = {
                tostring(roundsremaining),
                tostring(mult),
                tostring(chips),
                label
            }
        }
    end,

    pos = { x = 0, y = 0 },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = "wallyfranks",

    calculate = function(self, card, context)
        -- Main scoring effect
        if context.cardarea == G.jokers and context.joker_main then
            return {
                mult = self.config.extra.mult,
                extra = {
                    chips = self.config.extra.chips,
                    colour = G.C.CHIPS
                }
            }
        end

        -- End of round effect
        if context.end_of_round and not context.game_over and context.main_eval and not context.blueprint then
            card.ability.extra.roundsremaining = math.max(0, (card.ability.extra.roundsremaining or 5) - 1)

            if card.ability.extra.roundsremaining <= 0 then
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = "I'm Outta Here!",
                    colour = G.C.RED
                })
                play_IOH()
                card:start_dissolve()
                return { remove = true }
            end

            return true
        end
    end,
}

SMODS.Joker{
    name = "Drum Gun",
    key = "dg",
    config = {
        extra = {
            roundsremaining = 3,
            Xmult = 4
        }
    },
    loc_txt = {
        name = "Drum Gun",
        text = {
            "Gives {X:mult,C:white}X#2#{} Mult on hands",
            "played every 4th round.",
            "{C:inactive}(rounds remaining: {C:attention}#1#{}{C:inactive}){}"
        }
    },
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Bendy", G.C.BLACK, G.C.WHITE, 1)
    end,
    loc_vars = function(self, info_queue, card)
        local r = card.ability.extra and card.ability.extra.roundsremaining or 0
        local display = (r == 0) and "ACTIVE!" or tostring(r)
        local xmult = card.ability.extra and card.ability.extra.Xmult or self.config.extra.Xmult
        return {
            vars = {
                tostring(xmult),
                display
            },
        }
    end,

    pos = {x = 0, y = 0},
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = "dg",

    calculate = function(self, card, context)
        -- End of round countdown logic
        if context.end_of_round and not context.game_over and context.main_eval and not context.blueprint then
            card.ability.extra.roundsremaining = math.max(0, (card.ability.extra.roundsremaining or 0) - 1)
            return true
        end

        -- Effect triggers when counter hits 0
        if context.cardarea == G.jokers and context.joker_main then
            if (card.ability.extra.roundsremaining or 0) == 0 then
                card.ability.extra.roundsremaining = 3 -- Reset for next cycle
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}

SMODS.Joker{
    name = "Tom Nook",
    key = "tomnook",
    config = {
        extra = {
            gain_dollars = 3, -- Added this to match context.setting_blind logic
            set_dollars = 0
        }
    },
    loc_txt = {
        ['name'] = 'Tom Nook',
        ['text'] = {
            [1] = "Gives {C:money}$#1#{} when a {C:attention}Blind{} is played,",
            [2] = "but sets money to {C:money}$#2#{} when you skip one."
        }
    },
    pos = {x = 0, y = 0},
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'tomnook',

    loc_vars = function(self, info_queue, card)
        return {vars = {tostring(card.ability.extra.gain_dollars or 3), tostring(card.ability.extra.set_dollars or 0)}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            return {
                dollars = card.ability.extra.gain_dollars
            }
        end

        if context.skip_blind and not context.blueprint then
    G.GAME.dollars = card.ability.extra.set_dollars or 0
    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {
        message = "Set to $0",
        colour = G.C.MONEY
    })
    return true
end

    end
}

SMODS.Joker{
    name = "Heisenburg",
    key = "heisenburg",
    config = {
        extra = {
            inks = 0,
            gain_dollars = 10
        }
    },
    loc_txt = {
        ['name'] = 'Heisenburg',
        ['text'] = {
            [1] = 'At end of round, adds a negative {C:attention}Crystal Meth{} joker.',
            [2] = 'Once 3 are present, they are sold for {C:attention}$#1#{} and',
            [3] = 'creates a random {C:attention}Breaking Bad{} joker.',
            [4] = '{C:inactive}(if there is room){}'
        }
    },
    pos = {x = 0, y = 0},
    cost = 12,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'heisenburg',

    loc_vars = function(self, info_queue, card)
        local gain_dollars = (card.ability and card.ability.extra and card.ability.extra.gain_dollars) or (self.config and self.config.extra and self.config.extra.gain_dollars) or 10
        return {vars = {tostring(gain_dollars)}}
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Breaking Bad", G.C.GREEN, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.game_over and context.main_eval and not context.blueprint then
            return {
                func = function()
                    local bb_pool = {
                        "j_PSM_jp",
                        "j_PSM_sw",
                        "j_PSM_gus",
                        "j_PSM_saul",
                        "j_PSM_ts"
                    }

                    -- Count active Meth jokers
                    local meth_cards = {}
                    for _, joker in ipairs(G.jokers.cards) do
                        if joker.config.center.key == "j_PSM_meth" and not joker.getting_sliced then
                            table.insert(meth_cards, joker)
                        end
                    end

                    if #meth_cards < 3 then
                        -- Add another Meth
                        local meth = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_PSM_meth')
                        meth:set_edition("e_negative", true)
                        meth:add_to_deck()
                        G.jokers:emplace(meth)
                        card.ability.extra.inks = card.ability.extra.inks + 1
                        card_eval_status_text(card, 'extra', nil, nil, nil, {
                            colour = G.C.BLUE
                        })
                    elseif #meth_cards == 3 then
                        -- Check space
                        if #G.jokers.cards + G.GAME.joker_buffer >= G.jokers.config.card_limit then
                            card_eval_status_text(card, 'extra', nil, nil, nil, {
                                message = "No room!",
                                colour = G.C.RED
                            })
                            return true
                        end

                        -- Dissolve the meth cards
                        for _, meth in ipairs(meth_cards) do
                            meth.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    meth:start_dissolve({G.C.BLACK}, nil, 1.5)
                                    return true
                                end
                            }))
                        end

                        -- Delay and spawn BB joker + give $10
                        G.E_MANAGER:add_event(Event({
                            delay = 1.6,
                            func = function()
                                local chosen = pseudorandom_element(bb_pool)
                                local joker = create_card('Joker', G.jokers, nil, nil, nil, nil, chosen)
                                joker:add_to_deck()
                                G.jokers:emplace(joker)
                                card.ability.extra.inks = 0

                                ease_dollars(card.ability.extra.gain_dollars or 10)

                                card_eval_status_text(card, 'extra', nil, nil, nil, {
                                    message = "Say My Name",
                                    colour = G.C.BLUE
                                })
                                return true
                            end
                        }))
                    end

                    return true
                end
            }
        end
    end
}


SMODS.Joker{
    name = "Crystal Meth",
    key = "meth",
    config = {
        extra = {}
    },
    loc_txt = {
        ['name'] = 'Crystal Meth',
        ['text'] = {
            [1] = 'The purest stuff on the market',
            [2] = '{C:inactive}(used for the {}{C:attention}Heisenburg{} {C:inactive}joker){}'
        }
    },
    pos = {x = 0, y = 0},
    cost = 0,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'meth',

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    set_ability = function(self, card)
        card:set_eternal(true)
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Breaking Bad", G.C.GREEN, G.C.WHITE, 1)
    end,
}

SMODS.Joker {
    key = "jp",
    name = "Jesse Pinkman",
    atlas = "jp",
    config = {
        extra = {
            waltchips = 50,
            waltx_mult = 2,
            chips = 20,
            mult = 5
        }
    },
    rarity = 1,
    cost = 4,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = {x = 0, y = 0},

    loc_txt = {
        name = "Jesse Pinkman",
        text = {
            "If {C:attention}Heisenburg{} is present:",
            "{C:chips}+#1#{} Chips, {X:mult,C:white}X#2#{} Mult",
            "Otherwise: {C:chips}+#3#{} Chips, {C:mult}+#4#{} Mult"
        }
    },

   loc_vars = function(self, info_queue, card)
        return {vars = {tostring(card.ability.extra.waltchips or 50),
                        tostring(card.ability.extra.waltx_mult or 2),
                        tostring(card.ability.extra.chips or 20),
                        tostring(card.ability.extra.mult or 5)}}
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Breaking Bad", G.C.GREEN, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if not context.joker_main then return end

        local has_heisenburg = false
        for _, j in ipairs(G.jokers.cards) do
            if j ~= card then
                local key = (j.ability and j.ability.key)
                            or (j.config.center and j.config.center.key)
                if key == "j_PSM_heisenburg" then
                    has_heisenburg = true
                    break
                end
            end
        end

        if has_heisenburg then
            return {
                chips = card.ability.extra.waltchips or 50,
                x_mult = card.ability.extra.waltx_mult or 2,
                message = "Yo, Mr. White!",
                colour = G.C.GREEN
            }
        else
            return {
                chips = card.ability.extra.chips or 20,
                mult = card.ability.extra.mult or 5,
                colour = G.C.BLUE
            }
        end
    end
}

SMODS.Joker {
    name = "Skyler White",
    key = "sw",
    config = {
        extra = {
            multiplier = 4 -- Multiplier for total sell value
        }
    },
    atlas = "sw",
    rarity = 2,
    cost = 6,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = {x = 0, y = 0},

    loc_txt = {
        name = "Skyler White",
        text = {
            "Adds {C:attention}#2#X{} the total sell value",
            "of all your Jokers as {C:blue}Chips{}",
            "{C:inactive}(currently: {C:blue}+#1#{} {C:inactive}Chips){}"
        }
    },

    loc_vars = function(self, info_queue, card)
        local jokers = (G and G.jokers and G.jokers.cards) or {}
        local total_value = 0
        local multiplier = (card.ability and card.ability.extra and card.ability.extra.multiplier) or (self.config and self.config.extra and self.config.extra.multiplier) or 4
        for _, j in ipairs(jokers) do
            if j ~= card then
                local cost = (j.config and j.config.center and j.config.center.cost) or 0
                total_value = total_value + cost
            end
        end
        return { vars = { tostring(total_value * multiplier), tostring(multiplier) } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Breaking Bad", G.C.DARK_GREEN, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local total_value = 0
            local multiplier = (card.ability and card.ability.extra and card.ability.extra.multiplier) or (self.config and self.config.extra and self.config.extra.multiplier) or 4
            for _, j in ipairs(G.jokers.cards or {}) do
                if j ~= card then
                    local cost = (j.config and j.config.center and j.config.center.cost) or 0
                    total_value = total_value + cost
                end
            end
            return {
                chips = total_value * multiplier,
                colour = G.C.CHIPS
            }
        end
    end
}

SMODS.Joker {
    name = "Gus Fring",
    key = "gus",
    atlas = "gus",
    rarity = 3,
    cost = 10,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = { x = 0, y = 0 },

    config = {
        extra = {
            Xmult = 1, -- Starts at x1
            moneyperjoker = 1,
            Xmultperpair = 0.25 -- Multiplier increase for each Pair
        }
    },

    loc_txt = {
        name = "Gus Fring",
        text = {
            "Gives {C:money}$#2#{} per Joker when a {C:attention}Blind{} is selected",
            "If hand contains a {C:attention}Pair{}, gain {X:mult,C:white}X#3#{} Mult",
            "{C:inactive}(currently: {C:money}$#1#{}, {X:mult,C:white}X#2#{} {C:inactive}Mult){}"
        }
    },

    loc_vars = function(self, info_queue, card)
        local jokers = (G and G.jokers and G.jokers.cards) or {}
        local xmult = (card and card.ability and card.ability.extra and card.ability.extra.Xmult) or 1
        local moneyperjoker = (card and card.ability and card.ability.extra and card.ability.extra.moneyperjoker) or 1
        local xmultperpair = (card and card.ability and card.ability.extra and card.ability.extra.Xmultperpair) or 0.25
        local function format_xmult(value)
            if math.floor(value) == value then
                return tostring(value)
            else
                return string.format("%.2f", value)
            end
        end

        return {
            vars = {
                tostring(#jokers * moneyperjoker),
                tostring(moneyperjoker),
                tostring(xmultperpair),
                format_xmult(xmult)
            }
        }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Breaking Bad", G.C.DARK_GREEN, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        -- 💰 On Blind selection, gain $1 per Joker
        if context.setting_blind and not context.blueprint then
            local count = (G and G.jokers and G.jokers.cards and #G.jokers.cards) or 0
            return {
                dollars = count,
            }
        end

        -- 🂡 During scoring: if Pair present, upgrade xMult and show message early
        if context.cardarea == G.jokers and context.joker_main and context.poker_hands then
            if next(context.poker_hands["Pair"]) then
                local increment = card.ability.extra.Xmultperpair or 0.25
                card.ability.extra.Xmult = (card.ability.extra.Xmult or 1) + increment

                -- 💬 Show Tread Lightly before scoring
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {
                    message = "Tread Lightly",
                    colour = G.C.XMULT
                })
            end

            return {
                x_mult = card.ability.extra.Xmult or 1
            }
        end
    end
}

SMODS.Joker {
    name             = "Saul Goodman",
    key              = "saul",
    atlas            = "saul",
    rarity           = 3,
    cost             = 10,
    discovered       = true,
    blueprint_compat = true,
    eternal_compat   = false,
    pos              = { x = 0, y = 0 },

    config = {
        extra = {
            uses_remaining = 2,
            mult_active = false,
            startingsaves = 2,-- How many saves you start with
            mult = 20 -- Multiplier for the first save
        }
    },

    loc_txt = {
        name = "Saul Goodman",
        text = {
            "Prevents death {C:attention}#2#{} times.",
            "After the first save, gives {C:mult}+#3#{} Mult",
            "for the rest of the run,",
            "then disappears on the second save.",
            "{C:inactive}(remaining: {C:attention}#1#{}{C:inactive}){}"
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { tostring(card.ability.extra.uses_remaining or 0), tostring(card.ability.extra.startingsaves or 2), tostring(card.ability.extra.mult or 20) } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Breaking Bad", G.C.GREEN, G.C.WHITE, 1)
    end,

    on_round_start = function(self, card, context)
        -- Don't reset uses; keep them persistent across rounds
        card.ability.extra.mult_active = false
    end,

    calculate = function(self, card, context)
        local extra = card.ability.extra
        local uses  = extra.uses_remaining or 0

        if context.end_of_round and context.game_over and uses > 0 then
            extra.uses_remaining = uses - 1

            if uses == 2 then
                -- First save: Activate mult boost for future hands
                extra.mult_active = true
            elseif uses == 1 then
                -- Second save: Self-destruct
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve({ G.C.RED }, nil, 1.2)
                        return true
                    end
                }))
            end

            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = "Better Call Saul!",
                colour  = G.C.MONEY
            })

            return {
                saved   = true,
            }
        end

        -- 🟢 2) After first save, grant +20 mult every hand
        if context.joker_main and extra.mult_active then
            return {
                mult    = card.ability.extra.mult or 20,
            }
        end
    end
}

SMODS.Joker {
    key = "ts",
    atlas = "ts", -- You must provide tuco_salamanca.png in your mod folder
    rarity = 1, -- Common
    cost = 4,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = {x = 0, y = 0},

    config = {
        extra = {
            tuco_hit = false,
            multiplier = 2.22, -- Multiplier for the hit
            chips_loss = -30, -- Chips lost on miss
            chance = 1 -- 50% chance to hit
        }
    },

    loc_txt = {
        name = "Tuco Salamanca",
        text = {
            "Every hand: {C:attention}#3# in 2{} chance to gain",
            "{X:mult,C:white}X#1#{} Mult, or lose {C:chips}#2#{} Chips",
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                tostring(card.ability.extra.multiplier or 2.22),
                tostring(card.ability.extra.chips_loss or -30),
                tostring(card.ability.extra.chance or 1) -- Chance of hitting
            }
        }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Breaking Bad", G.C.GREEN, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers and not context.blueprint then
            card.ability.extra.tuco_hit = pseudorandom("tuco_flip") < tonumber((card.ability.extra.chance or 1)/2)
        end

        if context.joker_main then
            if card.ability.extra.tuco_hit then
                G.E_MANAGER:add_event(Event({
                func = function()
                    play_tt()
                    return true
                end,
                delay = 0.01
            }))
                return {
                    x_mult = (card.ability.extra.multiplier or 2.22),
                    message = "Tight! Tight Tight!",
                    colour = G.C.RED
                }
            else
                return {
                    chips = (card.ability.extra.chips_loss or -30),
                    colour = G.C.CHIPS
                }
            end
        end
    end
}

SMODS.Joker {
    key = "twix",
    name = "Twix Bar",
    config = {
        extra = {
            mult_straight = 10, -- Mult for Straight
            chips_flush = 70,   -- Chips for Flush
        }
    },
    atlas = "twix",
    rarity = 1,
    cost = 4,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = { x = 0, y = 0 },

    loc_txt = {
        name = "Twix Bar",
        text = {
            "Playing a {C:attention}Straight{} gives {C:mult}+#1#{} Mult,",
            "and playing a {C:attention}Flush{} gives {C:chips}+#2#{} Chips.",
            "If a {C:attention}Kanye{} Joker is equipped, double both values."
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                tostring(card.ability.extra.mult_straight or 10),
                tostring(card.ability.extra.chips_flush or 70)
            }
        }
    end,

    calculate = function(self, card, context)
        if not context.joker_main or not context.poker_hands then return end

        local has_kanye = false
        for _, j in ipairs(G.jokers.cards) do
            if j ~= card then
                local key = (j.ability and j.ability.key)
                            or (j.config.center and j.config.center.key)
                if key == "j_PSM_ye" or key == "j_PSM_yeezus" or key == "j_PSM_kanye" then
                    has_kanye = true
                    break
                end
            end
        end

        local mult1 = 0
        local chips1 = 0

        if next(context.poker_hands["Straight"]) then
            mult1 = mult1 + (card.ability.extra.mult_straight or 10)
        end
        if next(context.poker_hands["Flush"]) then
            chips1 = chips1 + (card.ability.extra.chips_flush or 70)
        end

        if has_kanye then
            mult1 = mult1 * 2
            chips1 = chips1 * 2
        end

        if mult1 > 0 or chips1 > 0 then
            return {
                mult = mult1 > 0 and mult1 or nil,
                chips = chips1 > 0 and chips1 or nil,
                message = has_kanye and "Double the Size"
            }
        end
    end
}

SMODS.Joker{
    key = "homelander",
    name = "Homelander",
    atlas = "homelander", -- Replace this with your registered image key
    rarity = 4,
    cost = 20,
    discovered = true,
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
    pos = {x = 0, y = 0},

    config = {
        extra = {
            total_xmult = 1,
            xmult_per_joker = 1 -- Multiplier per Joker destroyed
        }
    },

    loc_txt = {
        name = "Homelander",
        text = {
            "When {C:attention}blind{} is selected, destroy all",
            "{C:attention}Common{} and {C:attention}Uncommon{} Jokers equipped",
            "Gain {X:mult,C:white}X#2#{} Mult per destroyed Joker.",
            "{C:inactive}(total gained: {X:mult,C:white}X#1#{}{C:inactive}){}"
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
        vars = {
            tostring(math.floor((card.ability.extra.total_xmult or 1) + 0.5)),
            tostring(card.ability.extra.xmult_per_joker or 1)
        }
     }
    end,


    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("The Seven", G.C.PURPLE, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            return {
                func = function()
                    local destroyed = 0
                    local to_destroy = {}

                    for _, j in ipairs(G.jokers.cards) do
                        if j ~= card then
                            local rarity = (j.config and j.config.center and j.config.center.rarity) or -1
                            if rarity == 1 or rarity == 2 then
                                table.insert(to_destroy, j)
                            end
                        end
                    end

                    for _, j in ipairs(to_destroy) do
                        j.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                j:start_dissolve({G.C.GOLD}, nil, 1.5)
                                return true
                            end
                        }))
                        destroyed = destroyed + card.ability.extra.xmult_per_joker or 1
                    end

                    if destroyed > 0 then
                        card.ability.extra.total_xmult = (card.ability.extra.total_xmult or 1) + destroyed
                        card_eval_status_text(card, 'extra', nil, nil, nil, {
                            message = "X+" .. destroyed,
                            colour = G.C.XMULT
                        })
                    end

                    return true
                end
            }
        end

        if context.joker_main then
            local x = card.ability.extra.total_xmult or 1
            if x > 0 then
                return {
                    x_mult = x,
                    colour = G.C.XMULT
                }
            end
        end
    end
}

SMODS.Joker {
    key = "atrain",
    name = "A-Train",
    atlas = "atrain", -- register this in your mod
    rarity = 3,
    cost = 9,
    discovered = true,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = { x = 0, y = 0 },

    config = { extra = {
        x_chips = 4, -- Chips per hand
        x_loss_per_card = 0.5 -- Chips lost per card played
    }},

    loc_txt = {
        name = "A-Train",
        text = {
            "Gives {X:chips,C:white}X#1#{} Chips per hand,",
            "but loses {X:chips,C:white}X#2#{} per card played."
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                tostring(card.ability.extra.x_chips or 4),
                tostring(card.ability.extra.x_loss_per_card or 0.5)
            }
        }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("The Seven", G.C.PURPLE, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.full_hand then
            local cards_played = #context.full_hand
            local final_x = math.max(0, card.ability.extra.x_chips - (card.ability.extra.x_loss_per_card * cards_played))

            if final_x > 0 then
                return {
                    x_chips = final_x,
                    colour = G.C.CHIPS,
                }
            else
                return {
                    message = "Too Slow...",
                    colour = G.C.RED
                }
            end
        end
    end
}

SMODS.Joker {
    key = "td",
    name = "The Deep",
    config = {
        extra = {
            x_mult = 1.7, -- Multiplier for cards 2-7
            chips = 50    -- Chips gained
        }
    },
    atlas = "td",     -- make sure td.png is in your mod folder
    rarity = 3,       -- Rare
    cost = 7,         -- $7
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = { x = 0, y = 0 },

    loc_txt = {
        name = "The Deep",
        text = {
            "Played cards ranked {C:attention}2 through 7{} give:",
            "{X:mult,C:white}X#1#{} Mult and {C:chips}+#2#{} Chips"
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                tostring(card.ability.extra.x_mult or 1.7),
                tostring(card.ability.extra.chips or 50)
            }
        }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("The Seven", G.C.PURPLE, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local raw_id = context.other_card.base.id
            local rank = tonumber(raw_id)      -- tonumber("2") → 2, tonumber("Jack") → nil
            if rank and rank >= 2 and rank <= 7 then
                return {
                    x_mult = (card.ability.extra.x_mult or 1.7),
                    chips  = (card.ability.extra.chips or 50),
                    colour = G.C.CHIPS
                }
            end
        end
    end
}

SMODS.Joker {
    key = "cb",
    name = "Cherry Bomb",
    atlas = "cb",
    rarity = 2,
    cost = 6,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = { x = 0, y = 0 },

    config = {
        extra = { used_this_round = false, mult = 2.5 }
    },

    loc_txt = {
        name = "Cherry Bomb",
        text = {
            "On the {C:attention}first hand{} of each round:",
            "{C:attention}Destroys{} all played cards",
            "and grants {X:mult,C:white}X#1#{} Mult"
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { tostring(card.ability.extra.mult or 2.5) } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Tyler", G.C.GREEN, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        -- 1) **Actually remove** any card marked should_destroy
        if context.destroy_card and context.destroy_card.should_destroy then
            return { remove = true }
        end

        -- 2) Reset usage at the start of each round
        if context.setting_blind then
            card.ability.extra.used_this_round = false
        end

        -- 3) On the first hand of the round, mark & animate destruction
        if context.joker_main and not card.ability.extra.used_this_round then
            card.ability.extra.used_this_round = true

            -- mark for removal
            for _, c in ipairs(context.full_hand or {}) do
                c.should_destroy = true
            end

            -- animate dissolve
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _, c in ipairs(G.play.cards or {}) do
                        if not c.debuff then
                            c:start_dissolve({G.C.RED}, nil, 0.8)
                        end
                    end
                    return true
                end
            }))

            return {
                x_mult = (card.ability.extra.mult or 2.5),
                message = "CHERRY BOMB!",
                colour = G.C.RED
            }
        end
    end
}

SMODS.Joker {
    key = "sc",
    name = "St. Chroma",
    atlas = "sc",      -- make sure you add st_chroma.png to your mod
    rarity = 3,               -- adjust as desired
    cost = 8,                 -- adjust as desired
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = { x = 0, y = 0 },

    loc_txt = {
        name = "St. Chroma",
        text = {
            "Each scored {C:attention}face card{} gets",
            "a random {C:attention}Enhancement{}"
        }
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Tyler", G.C.GREEN, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)

        -- 2) On scoring each individual card...
        if context.individual and context.cardarea == G.play and not context.blueprint then
            -- Only trigger for face cards (J/Q/K/A)
            if context.other_card:is_face() then
                -- Pick a random enhancement
                local enh_key = { key = "chroma", guaranteed = true }
                local center_id = SMODS.poll_enhancement(enh_key)
                local enh_center = G.P_CENTERS[center_id]

                if enh_center then
                    -- Apply it to the scored face card
                    context.other_card:set_ability(enh_center, nil, true)
                    if context.other_card.set_cost then
                        context.other_card:set_cost()
                    end

                    -- Show popup on the Joker
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = "CHROMAKOOOPIA",
                        colour = G.C.FILTER
                    })
                end
            end
        end

        -- 3) Nothing to return on joker_main (this is purely a “side‑effect” Joker)
    end
}

-- Wolf Haley Joker
SMODS.Joker {
    key = "wh",
    name = "Wolf Haley",
    atlas = "wh",
    rarity = 1,
    cost = 4,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = { x = 0, y = 0 },

    -- Track total chips permanently gained
    config = {
        extra = {
            chip_total = 0,
            chipsperhand = 10 -- Chips gained per High Card hand
        }
    },

    loc_txt = {
        ['en-us'] = {
            name = "Wolf Haley",
            text = {
                "If played hand is a {C:attention}High Card{},",
                "gain {C:blue}+#2#{} Chips.",
                "{C:inactive}(currently: {C:blue}+#1#{} {C:inactive}Chips){}"
            }
        }
    },

    loc_vars = function(self, info_queue, card)
        local chips = card.ability.extra and card.ability.extra.chip_total or 0
        return { vars = { tostring(chips), tostring(card.ability.extra.chipsperhand or 10) } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Tyler", G.C.GREEN, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        -- Only run once when scoring your jokers
        if context.joker_main and not context.blueprint then
            -- Check for High Card hand
            if context.poker_hands
               and context.scoring_name == "High Card"
               and not card.ability._wh_processed then

                -- Award +10 permanent chips
                card.ability.extra.chip_total = (card.ability.extra.chip_total or 0) + 10

                -- Popup feedback
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = "+#2# Chips",
                    colour  = G.C.CHIPS
                })

                -- Prevent double-processing in this hand
                card.ability._wh_processed = true
            end

            -- Always return your current total as scoring bonus
            local total = card.ability.extra.chip_total or 0
            if total > 0 then
                return {
                    chips = total,
                    colour = G.C.CHIPS
                }
            end
        end

        -- Reset the per-hand flag before each new hand
        if context.before and context.cardarea == G.jokers and not context.blueprint then
            card.ability._wh_processed = false
        end
    end
}

SMODS.Joker {
    key = "bb",
    name = "Bruce Banner",
    atlas = "bb",
    rarity = 3,
    cost = 8,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = { x = 0, y = 0 },

    config = 
    {
        extra = {
            mult = 5, -- Multiplier for Mult
            hulkify_chance = 1
        }
    },

    loc_txt = {
        ['en-us'] = {
            name = "Bruce Banner",
            text = {
                "Gives {C:mult}+#1#{} Mult.",
                "At end of round: {C:attention}#2# in 6{} chance to",
                "transform into {C:attention}The Hulk{}."
            }
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { tostring(card.ability.extra.mult or 5),
                            tostring(card.ability.extra.hulkify_chance or 1)
     } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Marvel", G.C.RED, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        -- Main effect: +5 mult
        if context.joker_main then
            return {
                mult = (card.ability.extra.mult or 5),
                colour = G.C.MULT
            }
        end

        -- End of round: check for transformation
        if context.end_of_round and not context.game_over and context.main_eval and not context.blueprint then
            return {
                func = function()
                    local roll = pseudorandom("hulkify")
                    if roll < (tonumber(card.ability.extra.hulkify_chance or 1)/6) then
                        -- dissolve Bruce
                        card.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                card:start_dissolve({G.C.RED}, nil, 1.2)
                                return true
                            end
                        }))

                        -- delay and add Hulk
                        G.E_MANAGER:add_event(Event({
                            delay = 1.3,
                            func = function()
                                local hulk = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_PSM_hulk')
                                hulk:add_to_deck()
                                G.jokers:emplace(hulk)

                                card_eval_status_text(card, 'extra', nil, nil, nil, {
                                    message = "TRANSFORMING...",
                                    colour = G.C.RED
                                })
                                return true
                            end
                        }))
                    end
                    return true
                end
            }
        end
    end
}

SMODS.Joker {
    key = "hulk",
    name = "The Hulk",
    atlas = "hulk",
    rarity = 3,
    cost = 8,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = { x = 0, y = 0 },

    config = {
        extra = {
            xmult = 2.0,
            mult = 1.4 -- Multiplier for XMult at end of round
        }
    },

    loc_txt = {
        ['en-us'] = {
            name = "The Hulk",
            text = {
                "Gives a growing amount of {X:mult,C:white}XMult{} every round.",
                "At end of round, multiply {X:mult,C:white}XMult{} by {X:mult,C:white}X#2#{}.",
                "{C:inactive}(current XMult: {X:mult,C:white}X#1#{C:inactive})"
            }
        }
    },

    loc_vars = function(self, info_queue, card)
        local current = card.ability.extra and card.ability.extra.xmult or 2.0
        return { vars = { string.format("%.2f", current), tostring(card.ability.extra.mult or 1.4), } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Marvel", G.C.RED, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        -- At end of round, scale up XMult
        if context.end_of_round and not context.game_over and context.main_eval and not context.blueprint then
            card.ability.extra.xmult = (card.ability.extra.xmult or 2.0) * (card.ability.extra.mult or 1.4)
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = "RAGING...",
                colour = G.C.XMULT
            })
            return true
        end

        -- Every hand: apply current XMult
        if context.joker_main then
            return {
                x_mult = card.ability.extra.xmult or 2.0,
                colour = G.C.XMULT
            }
        end
    end
}



--- AAAAAAAA CCONSUMABLES HERE!!!

SMODS.Consumable {
    key     = 'cv',
    set     = 'Spectral',
    atlas   = 'cv',  -- Ensure you have a valid texture atlas called 'cv'
    pos     = { x = 0, y = 0 },

    loc_txt = {
        name = 'Compound V',
        text = {
            'Double the values on',
            '{C:attention}#1#{} selected Joker.'
        }
    },

    config = {
        extra = {
            cards = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.cards
            }
        }
    end,

    can_use = function(self, card)
        if G.jokers and G.jokers.highlighted and card.ability and card.ability.extra then
            local n = #G.jokers.highlighted
            return n > 0 and n <= card.ability.extra.cards
        end
        return false
    end,

    use = function(self, card, area, copier)
        if config.sfx ~= false then
            play_sound("tarot1")
        end

        -- Double numeric `extra` values on selected Joker(s)
        if G.jokers and G.jokers.highlighted then
            for _, joker in ipairs(G.jokers.highlighted) do
                if joker.ability and joker.ability.extra then
                    for key, val in pairs(joker.ability.extra) do
                        if type(val) == "number" then
                            joker.ability.extra[key] = val * 2
                        end
                    end
                    joker:juice_up()
                end
            end
        end
    end,
}
