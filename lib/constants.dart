var json = {
  "id": "19284d02-8513-4884-82a8-d3f9e260469c",
  "preInteraction": [
    {
      "text": "This\nis the correct answer",
      "type": "Paragraph",
      "order": 0,
      "id": "0eded459-1ebc-4c8d-a4e8-0514c79851d1",
      "visiableIf": "Always"
    },
    {
      "text": "<div>\nOrchestrator calculate orchid Specialist EXE </div>",
      "type": "Paragraph",
      "order": 1,
      "id": "9c890c21-7510-4145-90bd-43f1c954246a",
      "visiableIf": "Always"
    }
  ],
  "interactionModule": {
    "files": [
      {
        "codeLanguage": "HTML",
        "isInteractive": true,
        "content": "<div> Orchestrator calculate orchid Specialist EXE </div>",
        "name": "index.html"
      }
    ],
    "type": "codeFillInTheGap",
    "interactionOptions": [
      {
        "text": {
          "position": 1,
          "start": 6,
          "end": 18,
          "length": 12,
          "text": "Orchestrator"
        },
        "correctOption": true
      },
      {
        "text": {
          "position": 2,
          "start": 36,
          "end": 46,
          "length": 10,
          "text": "Specialist"
        },
        "correctOption": true
      },
      {
        "text": {
          "position": 3,
          "start": 19,
          "end": 28,
          "length": 9,
          "text": "calculate"
        },
        "correctOption": true
      }
    ],
    "wrongOptions": [
      "female",
      "vortals"
    ]
  },
  "postInteraction": [
    {
      "text": "Good job\ncorrect answer",
      "type": "Paragraph",
      "order": 0,
      "id": "a667cbb5-1312-4955-b0ce-68d19f2bca10",
      "visiableIf": "Correct"
    },
    {
      "text": "wrong\nanswer try again",
      "type": "Paragraph",
      "order": 1,
      "id": "84e36096-2fd2-4dab-bbb6-538d0704d056",
      "visiableIf": "Wrong"
    }
  ],
  "files": [
    {
      "codeLanguage": "HTML",
      "isInteractive": true,
      "content": "<div> Orchestrator\ncalculate orchid Specialist EXE </div>",
      "name": "index.html"
    }
  ],
  "type": "codeFillTheGap",
  "interactionOptions": [
    {
      "text": {
        "position": 1,
        "start": 6,
        "end": 18,
        "length": 12,
        "text": "Orchestrator"
      },
      "correctOption": true
    },
    {
      "text": {
        "position": 2,
        "start": 36,
        "end": 46,
        "length": 10,
        "text": "Specialist"
      },
      "correctOption": true
    },
    {
      "text": {
        "position": 3,
        "start": 19,
        "end": 28,
        "length": 9,
        "text": "calculate"
      },
      "correctOption": true
    }
  ],
  "wrongOptions": [
    "female",
    "vortals"
  ]
};