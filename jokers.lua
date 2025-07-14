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
            "{C:mult}+3{} Mult, {C:chips}+10{} Chips, and {C:money}$1{}"
        }
    },
    config = {},
    rarity = 1,
    cost = 5,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = "skibiditoiletrizz",
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.base.suit == "Hearts" and not context.other_card.debuff then
                ease_dollars(1)
                return {
                    chips = 10,
                    mult = 3,
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
            "Grants {X:mult,C:white}X3{} Mult",
            "{C:inactive}(1 in 4 chance to get {C:red}PRANKED!{}{C:inactive}){}",
            "and receive {X:mult,C:white}X0.01{} Mult instead"
        }
    },
    config = { extra = { prank = false } },
    rarity = 2,
    cost = 6,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = "kingofpranks",
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, card)
        local mult_display = card.ability.extra.prank and "0.01" or "3"
        return { vars = { mult_display } }
    end,
   calculate = function(self, card, context)
    if context.before and context.cardarea == G.jokers and not context.blueprint then
        card.ability.extra.prank = pseudorandom("prankster") < 0.25

    elseif context.joker_main then
        if card.ability.extra.prank then
            -- Delay sound by 1 frame so it plays with the scoring popup
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_kingofpranks()
                    return true
                end,
                delay = 0.01
            }))

            return {
                x_mult = 0.01,
                message = "PRANKED!",
                colour = G.C.RED
            }
        else
            return {
                x_mult = 3
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
                "{C:black}Coal (+1)",
                "{C:orange}Copper (+5)",
                "{C:blue}Iron (+10)",
                "{C:blue}Diamond (+25)",
                "{C:inactive}(currently: {C:attention}+#1#{C:inactive})"
            }
        }
    },

    config = {
        extra = {
            mined_total = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        local mined = card.ability.extra and card.ability.extra.mined_total or 0
        return {
            vars = {
                mined
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local roll = pseudorandom('mine_' .. tostring(context.other_card.uuid))
            local amount, label

            if roll < 0.50 then
                amount, label = 1, "Coal"
            elseif roll < 0.75 then
                amount, label = 5, "Copper"
            elseif roll < 0.95 then
                amount, label = 10, "Iron"
            else
                amount, label = 25, "Diamond"
            end

            card.ability.extra.mined_total = (card.ability.extra.mined_total or 0) + amount

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
            local total = card.ability.extra.mined_total or 0
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
            "{C:chips}+75{} Chips or {C:mult}+10{} Mult"
        }
    },
    config = {
        extra = {
            give_mult = false
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
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        -- Flip value at the start of each hand (before scoring)
        if context.before and context.cardarea == G.jokers and not context.blueprint then
            card.ability.extra.give_mult = not card.ability.extra.give_mult
        end

        -- Apply effect during scoring
        if context.joker_main then
            if card.ability.extra.give_mult then
                return {
                    mult = 10,
                    message = "Two-Way",
                    colour = G.C.MULT
                }
            else
                return {
                    chips = 75,
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
      "Grants {C:mult}+30{} Mult",
      "ONLY if you have no",
      "{C:attention}Common{} Jokers equipped"
    }
  },
  config = {},
  rarity = 2, -- Uncommon
  cost = 5,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  atlas = "racist",
  pos = { x = 0, y = 0 },
  pools = { Standard = true, Uncommon = true },

  calculate = function(self, card, context)
    if not context.joker_main then return end

    local has_common = false
    print("======== [RACIST FINAL DEBUG] ========")

    for i, j in ipairs(G.jokers.cards) do
      if j ~= card then
        local key = (j.ability and j.ability.key)
                    or (j.config.center.key)
                    or "???"
        local rarity = (j.config
                        and j.config.center
                        and j.config.center.rarity)
                        or -1

        print(string.format("[%d] %s | rarity = %s", i, key, tostring(rarity)))

        if rarity == 1 then
          has_common = true
          print("→ Detected Common Joker!")
          break
        end
      end
    end

    print("======== [END DEBUG] ==========")

    if not has_common then
      return { mult = 30, message = "pure...", colour = G.C.MULT }
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
    loc_txt = {
        name = "Ye",
        text = {
            "Each round randomly grants:",
            "{C:chips}+20{} Chips, {C:mult}+5{} Mult,",
            "or {X:mult,C:white}X1.5{} Mult"
        }
    },
    config = { extra = { mode = "chips" } },
    calculate = function(self, card, context)
        if context.setting_blind then
            local modes = {"chips", "mult", "xmult"}
            card.ability.extra.mode = pseudorandom_element(modes, pseudoseed("ye_shift"))
        elseif context.joker_main then
            if card.ability.extra.mode == "chips" then
                return { chips = 20, colour = G.C.CHIPS }
            elseif card.ability.extra.mode == "mult" then
                return { mult = 5, colour = G.C.MULT }
            elseif card.ability.extra.mode == "xmult" then
                return { x_mult = 1.5, colour = G.C.MULT }
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
    config = { extra = { triggered_this_hand = false } },
    loc_txt = {
        name = "Yeezus",
        text = {
            "At end of each hand, {C:attention}1 in 5{} chance",
            "to give a random {C:attention}Edition{} to",
            "a {C:attention}Joker{} or {C:attention}played card{}"
        }
    },
    calculate = function(self, card, context)
        -- Reset once per hand
        if context.before and context.main_eval then
            card.ability.extra.triggered_this_hand = false
        end

        if context.after and context.cardarea == G.jokers and not context.blueprint and not card.ability.extra.triggered_this_hand then
            card.ability.extra.triggered_this_hand = true

            local rolled = pseudorandom('yeezus_trigger')
            if rolled < .2 then
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
  config = {},
  loc_txt = {
    name = "Kanye West",
    text = {
      "Copies the effects of adjacent Jokers",
      "and adds {C:mult}+10{} Mult"
    }
  },

  calculate = function(self, card, context)
    local valid_phase = context.joker_main or context.individual
    if not valid_phase then return end

    local bonus = {}
    if context.joker_main then
      bonus = { mult = 10, message = "I Am Them", colour = G.C.MULT }
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
                "{C:blue}+20{} Chips and {X:mult,C:white}X0.4{} Mult",
                "{C:inactive}(currently: {C:blue}+#1#{} {C:inactive}Chips and {X:mult,C:white}X#2#{} {C:inactive}Mult){}"
            }
        }
    },

    config = {
        extra = {
            Chips = 0,
            XMult = 1.0
        }
    },

    loc_vars = function(self, info_queue, card)
        local chips = card.ability.extra and card.ability.extra.Chips or 0
        local xmult = card.ability.extra and card.ability.extra.XMult or 1
        return {
            vars = {
                tostring(chips),
                string.format("%.1f", xmult)
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
                card.ability.extra.Chips = (card.ability.extra.Chips or 0) + 20
                card.ability.extra.XMult = (card.ability.extra.XMult or 1) + 0.4
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
        chips = 20,
        mult = 3,
        hands = 1,     -- You lose 1 hand
        discards = 3   -- You gain 3 discards
    }
},


    loc_txt = {
        ['en-us'] = {
            name = "Alice Angel",
            text = {
                "When {C:attention}blind{} is selected,",
                "lose {C:blue}1{} hand and gain {C:red}3{} discards."
            }
        }
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Bendy", G.C.BLACK, G.C.WHITE, 1)
    end,

     loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.hands).." Hand", colour = G.C.RED})
                G.GAME.current_round.hands_left = math.max(0, G.GAME.current_round.hands_left - card.ability.extra.hands)
                return true
            end,
                    extra = {
                        func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.discards).." Discard", colour = G.C.ORANGE})
                G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + card.ability.extra.discards
                return true
            end,
                        colour = G.C.ORANGE
                        }
                }
        end
    end
}

SMODS.Joker {
    name = "Wally Franks",
    key = "wallyfranks",
    config = {
        extra = {
            rounds = 0,
            mult = 8,
            chips = 30
        }
    },
    loc_txt = {
        name = "Wally Franks",
        text = {
            "Gives {C:blue}+30{} Chips and {C:red}+8{} Mult",
            "Destroys after 5 rounds.",
            "{C:inactive}(remaining: {C:attention}#1#{} {C:inactive}#2#){}"
        }
    },
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Bendy", G.C.BLACK, G.C.WHITE, 1)
    end,
    loc_vars = function(self, info_queue, card)
        local rounds_used = card.ability.extra and card.ability.extra.rounds or 0
        local remaining = math.max(0, 5 - rounds_used)
        local label = (remaining == 1) and "round" or "rounds"
        return {
            vars = {
                tostring(remaining),
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
            card.ability.extra.rounds = (card.ability.extra.rounds or 0) + 1

            if card.ability.extra.rounds >= 5 then
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
            "Gives {X:mult,C:white}X4{} Mult on hands",
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
        return {
            vars = { display }
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
            [1] = "Gives {C:money}$3{} when a {C:attention}Blind{} is played,",
            [2] = "but sets money to {C:money}$0{} when you skip one."
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
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            return {
                dollars = card.ability.extra.gain_dollars
            }
        end

        if context.skip_blind and not context.blueprint then
    G.GAME.dollars = 0
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
            [2] = 'Once 3 are present, they are sold for {C:attention}$10{} and',
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
        return {vars = {}}
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
            "{C:chips}+50{} Chips, {X:mult,C:white}X2{} Mult",
            "Otherwise: {C:chips}+20{} Chips, {C:mult}+5{} Mult"
        }
    },

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
                chips = 50,
                x_mult = 2,
                message = "Yo, Mr. White!",
                colour = G.C.GREEN
            }
        else
            return {
                chips = 20,
                mult = 5,
                colour = G.C.BLUE
            }
        end
    end
}

SMODS.Joker {
    name = "Skyler White",
    key = "sw",
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
            "Adds {C:attention}4X{} the total sell value",
            "of all your Jokers as {C:blue}Chips{}",
            "{C:inactive}(currently: {C:blue}+#1#{} {C:inactive}Chips){}"
        }
    },

    loc_vars = function(self, info_queue, card)
        local jokers = (G and G.jokers and G.jokers.cards) or {}
        local total_value = 0
        for _, j in ipairs(jokers) do
            if j ~= card then
                local cost = (j.config and j.config.center and j.config.center.cost) or 0
                total_value = total_value + cost
            end
        end
        return { vars = { tostring(total_value * 4) } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Breaking Bad", G.C.DARK_GREEN, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local total_value = 0
            for _, j in ipairs(G.jokers.cards or {}) do
                if j ~= card then
                    local cost = (j.config and j.config.center and j.config.center.cost) or 0
                    total_value = total_value + cost
                end
            end
            return {
                chips = total_value * 4,
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
            Xmult = 1 -- Starts at x1
        }
    },

    loc_txt = {
        name = "Gus Fring",
        text = {
            "Gives {C:money}$1{} per Joker when a {C:attention}Blind{} is selected",
            "If hand contains a {C:attention}Pair{}, gain {X:mult,C:white}X0.25{} Mult",
            "{C:inactive}(currently: {C:money}$#1#{}, {X:mult,C:white}X#2#{} {C:inactive}Mult){}"
        }
    },

    loc_vars = function(self, info_queue, card)
        local jokers = (G and G.jokers and G.jokers.cards) or {}
        local xmult = (card and card.ability and card.ability.extra and card.ability.extra.Xmult) or 1

        local function format_xmult(value)
            if math.floor(value) == value then
                return tostring(value)
            else
                return string.format("%.2f", value)
            end
        end

        return {
            vars = {
                tostring(#jokers),
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
                card.ability.extra.Xmult = (card.ability.extra.Xmult or 1) + 0.25

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
            mult_active = false
        }
    },

    loc_txt = {
        name = "Saul Goodman",
        text = {
            "Prevents death {C:attention}2{} times.",
            "After the first save, gives {C:mult}+20{} Mult",
            "for the rest of the run,",
            "then disappears on the second save.",
            "{C:inactive}(remaining: {C:attention}#1#{}{C:inactive}){}"
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { tostring(card.ability.extra.uses_remaining or 0) } }
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
                mult    = 20,
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
            tuco_hit = false
        }
    },

    loc_txt = {
        name = "Tuco Salamanca",
        text = {
            "Every hand: {C:attention}50%{} chance to gain",
            "{X:mult,C:white}X2.22{} Mult, or lose {C:chips}-30{} Chips",
        }
    },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Breaking Bad", G.C.GREEN, G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers and not context.blueprint then
            card.ability.extra.tuco_hit = pseudorandom("tuco_flip") < 0.5
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
                    x_mult = 2.22,
                    message = "Tight! Tight Tight!",
                    colour = G.C.RED
                }
            else
                return {
                    chips = -30,
                    colour = G.C.CHIPS
                }
            end
        end
    end
}
