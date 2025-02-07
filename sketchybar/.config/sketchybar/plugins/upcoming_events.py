import math
import re
import subprocess
import sys
from dataclasses import dataclass
from datetime import datetime

@dataclass
class Event:
    calendar: str
    title: str
    start_time: datetime
    end_time: datetime

    def upcoming_message(self) -> str:
        """Get the message for upcoming event
        """
        now = datetime.now()
        delta = self.start_time - now
        delta_min = math.ceil(delta.total_seconds() / 60)
        if delta_min > 30:
            st = self.start_time.strftime("%I:%M %p")
            return f"At {st}: {self.title}"
        else:
            return f"In {delta_min} min: {self.title}"

    def active_message(self) -> str:
        """Get the message for currently active event
        """
        now = datetime.now()
        delta = self.end_time - now
        delta_min = math.ceil(delta.total_seconds() / 60)
        return f"Ends in {delta_min} min: {self.title}"

def get_todays_events(calendars: list[str]) -> list[Event]:
    """Gets all events for the day for the specified calendars (excludes all day events)
    """
    seperator = "###"
    joined = "|".join(calendars)
    pattern = rf"({joined}):{seperator}"
    script = f"icalbuddy -ea -sc -eep notes,location,attendees -ps '{seperator}' -ss {seperator} eventsToday"
    current_date = datetime.now().date()
    try:
        process = subprocess.run(script.split(),
                                text=True,
                                capture_output=True,
                                )
        events_for_all_calendars = process.stdout.strip().split("\n\n")
        events_for_desired_calendars = [event for event in events_for_all_calendars if re.search(pattern, event)]
        final_events = []
        for events in events_for_desired_calendars:
            lines = events.split("\n")
            calendar = lines[0].split(":")[0]
            lines = lines[1:]
            for event in lines:
                try:
                    title, times = event[1:].strip().split("###")
                    start_time, end_time = times.split("-")
                    start_time = datetime.strptime(f"{current_date} {start_time.strip()}", "%Y-%m-%d %I:%M %p")
                    end_time = datetime.strptime(f"{current_date} {end_time.strip()}", "%Y-%m-%d %I:%M %p")
                    final_events.append(Event(calendar, title, start_time, end_time))
                except:
                    pass
        return final_events
    except subprocess.CalledProcessError as e:
        print(f"Error fetching events: {e.stderr}")
        return []

def filter_inactive_events(events: list[Event]) -> list[Event]:
    """Filters inactive events meaning events that have started and ended before now
    """
    now = datetime.now()
    return [event for event in events if event.end_time > now]



def main():
    if len(sys.argv) == 1:
        print("invalid arguments! use like ./script <name of calendar1> <name of calendar2>...")
        exit(1)

    calendars = sys.argv[1:]
    all_events = get_todays_events(calendars)
    active_events = filter_inactive_events(all_events)
    sorted_active_events = sorted(active_events, key=lambda event: event.start_time)
    if not sorted_active_events:
        print("No Upcoming")
        exit(0)

    now = datetime.now()
    next_or_cur_event = sorted_active_events[0]
    if next_or_cur_event.start_time < now:
        # means the event is active
        print(next_or_cur_event.active_message())
    else:
        # means the event is upcoming
        print(next_or_cur_event.upcoming_message())

if __name__ == "__main__":
    main()
