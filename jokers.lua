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

-- Register sound
SMODS.Sound {
    key = "PSM_forever",
    path = "forever.ogg"
}
SMODS.Sound:register_global()

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
                    message = "Rizz!",
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
            "{C:inactive}(1 in 4 chance to get {C:red}PRANKED!{})",
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
            "{C:chips}+20 Chips{}, {C:mult}+5 Mult{},",
            "or {X:mult,C:white}X1.5 Mult{}"
        }
    },
    config = { extra = { mode = "chips" } },
    calculate = function(self, card, context)
        if context.setting_blind then
            local modes = {"chips", "mult", "xmult"}
            card.ability.extra.mode = pseudorandom_element(modes, pseudoseed("ye_shift"))
        elseif context.joker_main then
            if card.ability.extra.mode == "chips" then
                return { chips = 20, message = "YEnergy", colour = G.C.CHIPS }
            elseif card.ability.extra.mode == "mult" then
                return { mult = 5, message = "YEnergy", colour = G.C.MULT }
            elseif card.ability.extra.mode == "xmult" then
                return { x_mult = 1.5, message = "YEnergy", colour = G.C.MULT }
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
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = "Missed",
                    colour = G.C.PURPLE
                })
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
      "Copies the effect of adjacent Jokers",
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
                message = "Fizzed!",
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