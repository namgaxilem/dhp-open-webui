import React from "react";

const cards = [
  {
    title: "Planning",
    description:
      "An AI model autonomously determines what sequence of tasks to do to achieve a certain goal.",
  },
  {
    title: "Tool use",
    description:
      "Interaction with external services or resources to execute tasks (search for information, complete an action, edit databases).",
  },
  {
    title: "Reflection",
    description:
      "Iterative prompting to get the AI model to refine its output for a certain task.",
  },
  {
    title: "Multi-agent collaboration",
    description:
      "Use multiple agents, each with their own role, to complete specialized sub-tasks that add up to accomplish a broader project.",
  },
];

export default function FourCards() {
  return (
    <div className="max-w-7xl mx-auto px-6 py-12">
      <div className="flex justify-between gap-6">
        {cards.map(({ title, description }, idx) => (
          <div
            key={idx}
            className="flex-1 border-2 rounded-lg p-6 bg-white shadow hover:shadow-lg transition-shadow"
          >
            <h3 className="text-lg font-semibold mb-3">{title}</h3>
            <p className="text-gray-700 text-sm leading-relaxed">
              {description}
            </p>
          </div>
        ))}
      </div>
    </div>
  );
}
